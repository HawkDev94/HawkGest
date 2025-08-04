function esportaExcel() {
  const periodo = filtroPeriodo.value;
  const dati = datiProduzione[periodo];
  const n = dati.labels.length;

  const sheetData = [['Periodo', 'Laser 01', 'Piegatrice A', 'Centro Lavoro 3']];
  for (let i = 0; i < n; i++) {
    sheetData.push([
      dati.labels[i],
      dati.Laser[i],
      dati.Piegatrice[i],
      dati.CentroLavoro[i]
    ]);
  }

  const wb = XLSX.utils.book_new();
  const ws = XLSX.utils.aoa_to_sheet(sheetData);
  XLSX.utils.book_append_sheet(wb, ws, 'Produzione');
  XLSX.writeFile(wb, `Produzione_${periodo}.xlsx`);
}

function esportaPDF() {
  const container = document.querySelector('.container');
  html2canvas(container).then(canvas => {
    const imgData = canvas.toDataURL('image/png');
    const pdf = new jspdf.jsPDF('p', 'mm', 'a4');

    const pageWidth = pdf.internal.pageSize.getWidth();
    const pageHeight = pdf.internal.pageSize.getHeight();
    const ratio = Math.min(pageWidth / canvas.width, pageHeight / canvas.height);
    const width = canvas.width * ratio;
    const height = canvas.height * ratio;

    pdf.addImage(imgData, 'PNG', 10, 10, width - 20, height - 20);
    pdf.save('dashboard_produzione.pdf');
  });
}
