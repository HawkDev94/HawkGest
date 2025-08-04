<cf_header>

  <div class="container">
      <h1 class="mb-4">Ordini</h1>
      <div class="card-body">
        <div id="clienti-table"></div>
      </div>
    </div>
  </div>
  
  <cf_footer>
  <script>
    var col = [
        {title: "ID", field: "id", hozAlign: "center"},
        {title: "Nome", field: "NAME"},
        {title: "Sesso", field: "gender"},
        {title: "Data nascita", field: "dob"},
        {title: "Telefono", field: "telefono"},
        {
          title: "Azioni",
          headerSort: false,
          formatter: function () {
            return `
              <button class="btn btn-sm btn-outline-primary me-1">
                <i class="bi bi-pencil"></i>
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="bi bi-trash"></i>
              </button>
            `;
          },
          width: 100,
          hozAlign: "center"
        }
      ];
      
  createTabulatorTable("#clienti-table", "customers", "getClienti",{}, col);

    /*const table = new Tabulator("#clienti-table", {
      ajaxURL: "/components/customers.cfc?method=getClienti",
      ajaxConfig: {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "cognome=Rossi"
      },
      layout: "fitColumns",
      responsiveLayout: "collapse",
      pagination: "local",
      paginationSize: 10,
      movableColumns: true,
      columns: [
        {title: "ID", field: "id", hozAlign: "center"},
        {title: "Nome", field: "NAME"},
        {title: "Sesso", field: "gender"},
        {title: "Data nascita", field: "dob"},
        {title: "Telefono", field: "telefono"},
        {
          title: "Azioni",
          headerSort: false,
          formatter: function () {
            return `
              <button class="btn btn-sm btn-outline-primary me-1">
                <i class="bi bi-pencil"></i>
              </button>
              <button class="btn btn-sm btn-outline-danger">
                <i class="bi bi-trash"></i>
              </button>
            `;
          },
          width: 100,
          hozAlign: "center"
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
    });*/
  </script>
