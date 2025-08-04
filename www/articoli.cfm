<cf_header
pChoose="6">

<div class="container">
    <h1 class="mb-4">Articoli</h1>
    <div class="card-body">
      <div id="products-table"></div>
    </div>
  </div>

   <script>
    var col = [
        {title: "ID", field: "id", hozAlign: "center"},
        {title: "Nome", field: "name",headerFilter: "input",headerFilterPlaceholder: "Cerca...",},
        {
          title: "Azioni",
          headerSort: false,
          formatter: function (cell, formatterParams) {
            const rowData = cell.getData(); 
            return `
              <a href="/dettaglio_prodotto.cfm?id=${rowData.id}" class="btn btn-sm btn-outline-primary me-1">
                <i class="bi bi-pencil"></i>
              </a>              
            `;
          },          
          width: 100,
          hozAlign: "center"
        }
      ];
      
    createTabulatorTable("#products-table", "products", "getProducts",{}, col);
  </script>


<cf_footer>