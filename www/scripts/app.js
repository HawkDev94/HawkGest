 var _callCFC = function ( settings, pCFC, pMethod, oParameters, pFnSuccess, pBstopLoader) {
  
  stopLoader = typeof pBstopLoader != 'undefined' && typeof pBstopLoader != 'null' ? pBstopLoader : true;

  var defaults = {
    async: true,
    type: 'POST',
    url: _mapping_cfc + '/components/' + pCFC + '.cfc?method=' + pMethod,
    data: {},
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    beforeSend: function (jqXHR, settings) {},
    complete: function (jqXHR, textStatus) {
      // stop loader frontend
      if (typeof loadingAjaxStop != 'undefined' && stopLoader)
        loadingAjaxStop();
    },
    error: function (jqXHR, textStatus, errorThrown) {
      //location.href="/error.htm";
    },
    cache: false,
    urlParam: false,
  };

  //oParameters can be one object or string
  $.extend(defaults, settings);

  if (defaults['type'].toLowerCase() == 'get') {
    defaults['url'] += '?method=' + pMethod + '&' + $.param(oParameters); //JSON.stringify(send); + "&_key=" + _key
  } else {
    $.extend(defaults['data'], { method: pMethod }, oParameters); //, {"_key":_key}
  }

  if (defaults.urlParam) {
    defaults['url'] += '?' + $.param(oParameters);
  }

  $.ajax({
    url: defaults['url'],
    type: defaults['type'],
    data: defaults['data'],
    async: defaults['async'],
    //,contentType:	defaults["contentType"]
    dataType: defaults['dataType'],
    //,processData:	false
    beforeSend: defaults['beforeSend'],
    complete: defaults['complete'],
    success: function (data, textStatus, jqXHR) {
      if (pFnSuccess != '' && $.type(pFnSuccess) === 'function') {
        pFnSuccess(data);
      } else if (pFnSuccess != '' && $.type(pFnSuccess) === 'string') {
        eval(pFnSuccess)(data);
      }
    }, //if (jqXHR.readyState == 0 || jqXHR.status == 0) return;
    error: defaults['error'],
    cache: defaults['cache'],
  });
};

/**
 * Chiamata AJAX generica.
 * @param {string} endpoint - URL/funzione server da chiamare
 * @param {Object|FormData} data - dati del form (JSON plain object o FormData)
 * @param {Object} [opts]
 * @param {string} [opts.method="POST"]
 * @param {boolean} [opts.asJson=true] - se true invia JSON; se false usa direttamente FormData
 * @param {Object} [opts.headers={}] - header extra
 * @param {number} [opts.timeout=15000] - ms
 * @returns {Promise<any>} - risposta parsata (json o text)
 */
async function ajax(endpoint, data, {
  method = "POST",
  asJson = true,
  headers = {},
  timeout = 15000
} = {}) {
  const controller = new AbortController();
  const id = setTimeout(() => controller.abort(), timeout);

  let body;
  const finalHeaders = { ...headers };

  if (asJson) {
    body = JSON.stringify(data);
    finalHeaders["Content-Type"] = "application/json";
    finalHeaders["Accept"] = "application/json";
  } else {
    // data deve essere un FormData
    body = data;
    // NON settare Content-Type: lo fa il browser
  }

  try {
    const res = await fetch(endpoint, {
      method,
      body,
      headers: finalHeaders,
      signal: controller.signal
    });

    const contentType = res.headers.get("content-type") || "";
    const payload = contentType.includes("application/json")
      ? await res.json()
      : await res.text();

    if (!res.ok) {
      const error = new Error("Request failed");
      error.status = res.status;
      error.payload = payload;
      throw error;
    }

    return payload;
  } finally {
    clearTimeout(id);
  }
}

/* Helper: da <form> a plain object */
function formToJSON(formEl) {
  return Object.fromEntries(new FormData(formEl).entries());
}

function createTabulatorTable(tableId, cfc, functioname, postParams = {}, columns = []) {  
  if (!window.Tabulator) {
    console.error("Tabulator.js non è stato caricato.");
    return;
  }

  var dataUrl = "/components/"+cfc+".cfc?method="+functioname;

  const table = new Tabulator(tableId, {
    ajaxURL: dataUrl,
    ajaxConfig: {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams(postParams).toString(),
    },
    layout: "fitColumns",
    responsiveLayout: "collapse",
    pagination: "local",
    paginationSize: 10,
    movableColumns: true,
    columns: columns.length ? columns : [
      { title: "ID", field: "id", width: 60, hozAlign: "center" },
      { title: "Nome", field: "name" },
      { title: "Sesso", field: "gender" },
      { title: "Data Nascita", field: "dob" },
      {
        title: "Azioni", headerSort: false, width: 100, hozAlign: "center",
        formatter: () => `
          <button class="btn btn-sm btn-outline-primary me-1">
            <i class="bi bi-pencil"></i>
          </button>
          <button class="btn btn-sm btn-outline-danger">
            <i class="bi bi-trash"></i>
          </button>`
      }
    ],
    langs: {
      "default": {
        "pagination": {
          "first": "Primo",
          "last": "Ultimo",
          "prev": "Prec.",
          "next": "Succ."
        }
      }
    }
  });

  return table;
}


// Funzione logout
function logout() {
  sessionStorage.removeItem("username");
  sessionStorage.removeItem("password");
  window.location.href = "login.html";
}
  