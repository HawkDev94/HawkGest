<cf_header
  pChoose="4">
  <div class="container my-4">
    <h1 class="mb-4">Gestione Operai</h1>

    <form id="operaForm" class="mb-4">
      <div class="row g-3">
        <div class="col-md-4">
          <label for="nome" class="form-label">Nome</label>
          <input type="text" id="nome" class="form-control" required />
        </div>
        <div class="col-md-4">
          <label for="cognome" class="form-label">Cognome</label>
          <input type="text" id="cognome" class="form-control" required />
        </div>
        <div class="col-md-4">
          <label for="dataNascita" class="form-label">Data di Nascita</label>
          <input type="date" id="dataNascita" class="form-control" required />
        </div>
      </div>

      <div class="mt-3">
        <label for="mansione" class="form-label">Mansione</label>
        <select id="mansione" class="form-select" required>
          <option value="" selected disabled>Seleziona mansione</option>
          <option value="Operaio generico">Operaio generico</option>
          <option value="Addetto macchine">Addetto macchine</option>
          <option value="Manutentore">Manutentore</option>
          <option value="Responsabile produzione">Responsabile produzione</option>
        </select>
      </div>

      <button type="submit" class="btn btn-primary mt-3">Aggiungi Operaio</button>
    </form>

    <h2>Elenco Operai</h2>
    <table class="table table-striped" id="tabellaOperai">
      <thead>
        <tr>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Data di Nascita</th>
          <th>Mansione</th>
          <th>Azioni</th>
        </tr>
      </thead>
      <tbody>
        <!-- righe dinamiche -->
      </tbody>
    </table>
  </div>

  <script>
    const form = document.getElementById('operaForm');
    const tabella = document.getElementById('tabellaOperai').querySelector('tbody');

    form.addEventListener('submit', e => {
      e.preventDefault();

      const nome = document.getElementById('nome').value.trim();
      const cognome = document.getElementById('cognome').value.trim();
      const dataNascita = document.getElementById('dataNascita').value;
      const mansione = document.getElementById('mansione').value;

      if (!nome || !cognome || !dataNascita || !mansione) {
        alert('Compila tutti i campi!');
        return;
      }

      // Crea nuova riga tabella
      const tr = document.createElement('tr');

      tr.innerHTML = `
        <td>${nome}</td>
        <td>${cognome}</td>
        <td>${dataNascita}</td>
        <td>${mansione}</td>
        <td>
          <button class="btn btn-sm btn-danger btn-elimina">Elimina</button>
        </td>
      `;

      tabella.appendChild(tr);

      // Pulisci form
      form.reset();

      // Aggiungi evento elimina
      tr.querySelector('.btn-elimina').addEventListener('click', () => {
        if (confirm('Sei sicuro di voler eliminare questo operaio?')) {
          tr.remove();
        }
      });
    });
  </script>
  <script src="scripts/app.js"></script>
<cf_footer>