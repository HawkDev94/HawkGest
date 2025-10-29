<cf_header
pChoose="6">

<div class="container">
  <div class="position-relative">
    <h1 class="mb-4">Articoli</h1>
    <button type="button" class="position-absolute top-0 end-0 btn btn-primary mt-3" onclick="window.location.href='nuovo-articolo.cfm'">Aggiungi Nuovo Articolo</button>
  </div>
    <div class="card-body">
      <div id="products-table"></div>
    </div>
  </div>

  <cfset aoData=[
    {label="Nome macchina", inputtype="text", inputid="nome", inputname="nome", required=true}
    ,{label="Matricola", inputtype="text", inputid="serial", inputname="serial", required=true}
    ,{label="Tipo Macchina", inputtype="select", inputid="machinetype", inputname="machinetype", option=[{nome="Laser", id="1"}, {nome="Piegatrice", id="2"}, {nome="Saldatrice", id="3"}]}
  ]>
  

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