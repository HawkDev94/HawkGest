const materiali = [
  { id: 1, descrizione: "Lamiera acciaio 2mm", quantita: 320, unita: "kg", ubicazione: "Scaffale A1", stato: "Disponibile" },
  { id: 2, descrizione: "Barra tonda Ø20mm", quantita: 95, unita: "pz", ubicazione: "Scaffale B2", stato: "Disponibile" },
  { id: 3, descrizione: "Profilo alluminio", quantita: 60, unita: "m", ubicazione: "Scaffale C3", stato: "In riordino" },
  { id: 4, descrizione: "Viti M8x30", quantita: 500, unita: "pz", ubicazione: "Cassettiera Viti", stato: "Disponibile" },
  { id: 5, descrizione: "Tubi saldati Ø50", quantita: 12, unita: "pz", ubicazione: "Esterno", stato: "Basso stock" }
];

function caricaMagazzino() {
  const tbody = document.querySelector('#magazzinoTable tbody');
  materiali.forEach(mat => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${mat.id}</td>
      <td>${mat.descrizione}</td>
      <td>${mat.quantita}</td>
      <td>${mat.unita}</td>
      <td>${mat.ubicazione}</td>
      <td>${mat.stato}</td>
    `;
    tbody.appendChild(tr);
  });
}

document.addEventListener('DOMContentLoaded', caricaMagazzino);
