/*const macchine = [
  {
    id: 1,
    nome: "Tornio CNC T-400",
    tipo: "Tornio",
    stato: "Operativa",
    ultima: "2025-05-10",
    prossima: "2025-11-10"
  },
  {
    id: 2,
    nome: "Fresa verticale FV-200",
    tipo: "Fresa",
    stato: "In manutenzione",
    ultima: "2025-04-01",
    prossima: "2025-10-01"
  },
  {
    id: 3,
    nome: "Laser CO2 1500W",
    tipo: "Taglio Laser",
    stato: "Operativa",
    ultima: "2025-06-15",
    prossima: "2025-12-15"
  },
  {
    id: 4,
    nome: "Piegatrice idraulica P-300",
    tipo: "Piegatrice",
    stato: "Fuori servizio",
    ultima: "2025-03-20",
    prossima: "Da definire"
  }
];

function caricaMacchine() {
  const tbody = document.querySelector('#macchineTable tbody');
  macchine.forEach(mac => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${mac.id}</td>
      <td>${mac.nome}</td>
      <td>${mac.tipo}</td>
      <td>${statoBadge(mac.stato)}</td>
      <td>${mac.ultima}</td>
      <td>${mac.prossima}</td>
    `;
    tbody.appendChild(tr);
  });
}

function statoBadge(stato) {
  let classe = "secondary";
  if (stato === "Operativa") classe = "success";
  else if (stato === "In manutenzione") classe = "warning";
  else if (stato === "Fuori servizio") classe = "danger";

  return `<span class="badge bg-${classe}">${stato}</span>`;
}

document.addEventListener('DOMContentLoaded', caricaMacchine);*/
