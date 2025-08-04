<cf_header>
  
  <div class="container">
    <h1 class="mb-4">Dashboard Produzione</h1>
    <div class="row mb-3">
      <div class="col-md-4">
        <div class="card text-bg-primary">
          <div class="card-body">
            <h5 class="card-title">Ordini aperti</h5>
            <p class="card-text" id="openOrders">0</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card text-bg-warning">
          <div class="card-body">
            <h5 class="card-title">Magazzino</h5>
            <p class="card-text" id="stockItems">0</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card text-bg-success">
          <div class="card-body">
            <h5 class="card-title">Operai attivi</h5>
            <p class="card-text" id="activeWorkers">0</p>
          </div>
        </div>
      </div>
    </div>

    <h2>Ordini recenti</h2>
    <table class="table table-striped" id="ordersTable">
      <thead><tr><th>ID</th><th>Cliente</th><th>Quantità</th><th>Stato</th></tr></thead>
      <tbody></tbody>
    </table>
  </div>

<cf_footer>