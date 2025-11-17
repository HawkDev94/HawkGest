
</div></div>

<footer style="background-color: #2c3e50;color: #ecf0f1;text-align: center;padding: 15px 10px;font-size: 14px;position: fixed;bottom: 0;width: 100%;box-shadow: 0 -2px 5px rgba(0,0,0,0.1);">
  <div>
    &copy; 2025 <strong>HawkGest</strong> - Tutti i diritti riservati.
  </div>
</footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
  <script>
    const data = {
        openOrders: 12,
        stockItems: 250,
        activeWorkers: 8,
        recentOrders: [
          { id: 101, client: 'ACME SRL', qty: 50, status: 'In produzione' },
          { id: 102, client: 'Beta LTD', qty: 120, status: 'Completato' },
          { id: 103, client: 'Gamma SPA', qty: 30, status: 'In attesa' }
        ]
      };

      function populateDashboard() {
        document.getElementById('openOrders').textContent = data.openOrders;
        document.getElementById('stockItems').textContent = data.stockItems;
        document.getElementById('activeWorkers').textContent = data.activeWorkers;

        const tbody = document.querySelector('#ordersTable tbody');
        data.recentOrders.forEach(o => {
          const tr = document.createElement('tr');
          tr.innerHTML = `
            <td>${o.id}</td>
            <td>${o.client}</td>
            <td>${o.qty}</td>
            <td>${o.status}</td>
          `;
          tbody.appendChild(tr);
        });
      }

      document.addEventListener('DOMContentLoaded', populateDashboard);
  </script>

</body>
</html>
