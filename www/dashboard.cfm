<cf_header
  pChoose="1">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <div class="container my-4">
    <h1 class="mb-4">Dashboard Produzione</h1>

    <!-- Filtri -->
    <div class="row mb-4">
      <div class="col-md-4">
        <label for="filtroPeriodo" class="form-label">Periodo</label>
        <select id="filtroPeriodo" class="form-select">
          <option value="giornaliero">Giornaliero</option>
          <option value="settimanale" selected>Settimanale</option>
          <option value="mensile">Mensile</option>
        </select>
      </div>
      <div class="col-md-4">
        <label for="filtroMacchina" class="form-label">Macchina</label>
        <select id="filtroMacchina" class="form-select">
          <option value="Tutte">Tutte</option>
          <option value="Laser 01">Laser 01</option>
          <option value="Piegatrice A">Piegatrice A</option>
          <option value="Centro Lavoro 3">Centro Lavoro 3</option>
        </select>
      </div>
    </div>
    <div class="mb-4">
  <button class="btn btn-success me-2" onclick="esportaExcel()">Esporta in Excel</button>
  <button class="btn btn-danger" onclick="esportaPDF()">Esporta in PDF</button>
</div>


    <!-- Grafici -->
    <div class="row g-4">
      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">
            <h5 class="card-title">Produzione per Macchina</h5>
            <canvas id="graficoMacchine"></canvas>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">
            <h5 class="card-title">Produzione Totale per Periodo</h5>
            <canvas id="graficoPeriodo"></canvas>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">
            <h5 class="card-title">Distribuzione Percentuale per Macchina</h5>
            <canvas id="graficoTorta"></canvas>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">
            <h5 class="card-title">Produzione Media per Macchina</h5>
            <canvas id="graficoOrizzontale"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Script JS -->
  <script>
    const datiProduzione = {
      giornaliero: {
        labels: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven'],
        Laser: [40, 45, 38, 50, 47],
        Piegatrice: [25, 30, 28, 26, 32],
        CentroLavoro: [15, 12, 18, 16, 14]
      },
      settimanale: {
        labels: ['Settimana 1', 'Settimana 2', 'Settimana 3', 'Settimana 4'],
        Laser: [180, 190, 170, 200],
        Piegatrice: [130, 120, 140, 135],
        CentroLavoro: [60, 55, 65, 62]
      },
      mensile: {
        labels: ['Gen', 'Feb', 'Mar', 'Apr'],
        Laser: [750, 820, 780, 860],
        Piegatrice: [520, 500, 540, 530],
        CentroLavoro: [210, 190, 230, 220]
      }
    };

    const filtroPeriodo = document.getElementById('filtroPeriodo');
    const filtroMacchina = document.getElementById('filtroMacchina');

    const ctxMacchine = document.getElementById('graficoMacchine').getContext('2d');
    const ctxPeriodo = document.getElementById('graficoPeriodo').getContext('2d');
    const ctxTorta = document.getElementById('graficoTorta').getContext('2d');
    const ctxOrizzontale = document.getElementById('graficoOrizzontale').getContext('2d');

    let chartMacchine, chartPeriodo, chartTorta, chartOrizzontale;

    function aggiornaGrafici() {
      const periodo = filtroPeriodo.value;
      const macchina = filtroMacchina.value;
      const dati = datiProduzione[periodo];
      const labels = dati.labels;

      // Dataset per grafico a barre
      const datiBarre = {
        labels,
        datasets: []
      };

      if (macchina === 'Tutte') {
        datiBarre.datasets = [
          { label: 'Laser 01', data: dati.Laser, backgroundColor: '#007bff' },
          { label: 'Piegatrice A', data: dati.Piegatrice, backgroundColor: '#28a745' },
          { label: 'Centro Lavoro 3', data: dati.CentroLavoro, backgroundColor: '#ffc107' }
        ];
      } else {
        const serie = macchina === 'Laser 01' ? dati.Laser :
                      macchina === 'Piegatrice A' ? dati.Piegatrice :
                      dati.CentroLavoro;
        datiBarre.datasets = [{
          label: macchina,
          data: serie,
          backgroundColor: '#17a2b8'
        }];
      }

      // Dataset per linea: totale per periodo
      const datiLinee = {
        labels,
        datasets: [{
          label: 'Totale Produzione',
          data: dati.Laser.map((v, i) => v + dati.Piegatrice[i] + dati.CentroLavoro[i]),
          borderColor: '#dc3545',
          backgroundColor: 'rgba(220,53,69,0.1)',
          fill: true,
          tension: 0.3
        }]
      };

      // Torta: percentuali totali
      const totaleLaser = dati.Laser.reduce((a, b) => a + b, 0);
      const totalePiegatrice = dati.Piegatrice.reduce((a, b) => a + b, 0);
      const totaleCentro = dati.CentroLavoro.reduce((a, b) => a + b, 0);

      const datiTorta = {
        labels: ['Laser 01', 'Piegatrice A', 'Centro Lavoro 3'],
        datasets: [{
          data: [totaleLaser, totalePiegatrice, totaleCentro],
          backgroundColor: ['#007bff', '#28a745', '#ffc107']
        }]
      };

      // Orizzontale: medie
      const n = dati.labels.length;
      const datiOrizzontale = {
        labels: ['Laser 01', 'Piegatrice A', 'Centro Lavoro 3'],
        datasets: [{
          label: 'Produzione Media',
          data: [totaleLaser/n, totalePiegatrice/n, totaleCentro/n],
          backgroundColor: ['#007bff', '#28a745', '#ffc107']
        }]
      };

      // Distruggi grafici esistenti
      [chartMacchine, chartPeriodo, chartTorta, chartOrizzontale].forEach(c => c && c.destroy());

      chartMacchine = new Chart(ctxMacchine, { type: 'bar', data: datiBarre });
      chartPeriodo = new Chart(ctxPeriodo, { type: 'line', data: datiLinee });
      chartTorta = new Chart(ctxTorta, { type: 'pie', data: datiTorta });
      chartOrizzontale = new Chart(ctxOrizzontale, {
        type: 'bar',
        data: datiOrizzontale,
        options: { indexAxis: 'y' }
      });
    }

    filtroPeriodo.addEventListener('change', aggiornaGrafici);
    filtroMacchina.addEventListener('change', aggiornaGrafici);
    aggiornaGrafici();
  </script>

  
  <!-- Excel -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

<!-- PDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="scripts/dashboard.js"></script>

<cf_footer>