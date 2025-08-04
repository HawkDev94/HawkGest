<cf_header
  pChoose="2">
  
  <div class="container">
    <h1 class="mb-4">Ordini</h1>
    <div class="card-body">
      <div id="ordini-table"></div>
    </div>
  </div>

   <script>
    var col = [
        {title: "ID Ordine", field: "id_order", hozAlign: "center"},
        {title: "Cliente", field: "client_name"},
        {title: "Azienda", field: "company_name"},
        {title: "Data ordine", field: "date_order"},
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
      
    createTabulatorTable("#ordini-table", "orders", "getOrders",{}, col);
  </script>

  <cf_footer>
