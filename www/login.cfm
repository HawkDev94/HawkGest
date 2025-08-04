<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Gestionale Produzione - Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f0f2f5;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .box {
      width: 100%;
      max-width: 500px;
      padding: 2rem;
      background: white;
      border-radius: 1rem;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    #mainContent {
      display: none;
    }
  </style>
</head>
<body>

<!-- Login box -->
<div class="box" id="loginBox">
  <h2 class="text-center mb-4">Accesso al Gestionale</h2>
  <form id="loginForm">
    <div class="mb-3">
      <label for="username" class="form-label">Utente</label>
      <input type="text" class="form-control" id="username" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" required>
    </div>
    <div class="form-check mb-3">
      <input class="form-check-input" type="checkbox" id="rememberMe">
      <label class="form-check-label" for="rememberMe">Ricorda per questa sessione</label>
    </div>
    <div class="d-grid">
      <button type="submit" class="btn btn-primary">Accedi</button>
    </div>
    <div id="loginMessage" class="text-danger text-center mt-3" style="display:none;"></div>
  </form>
</div>

<!-- Contenuto principale (mostrato se loggato) -->
<div class="box text-center" id="mainContent">
  <h2>Benvenuto, <span id="utenteLoggato"></span>!</h2>
  <p>Sei loggato correttamente.</p>
  <button class="btn btn-outline-danger mt-3" onclick="logout()">Logout</button>
</div>

<script>
  // Mostra il contenuto corretto in base al login
  window.addEventListener('DOMContentLoaded', () => {
    const user = sessionStorage.getItem('username');
    const pass = sessionStorage.getItem('password');

    if (user && pass) {
      // Loggato      
      window.location.href="/index.html";
    } else {
      // Non loggato
      document.getElementById('loginBox').style.display = 'block';
    }
  });

  // Gestione login
  document.getElementById("loginForm").addEventListener("submit", function(e) {
    e.preventDefault();

    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const remember = document.getElementById("rememberMe").checked;

    // Verifica fittizia
    if (username === "admin" && password === "admin123") {
      if (remember) {
        sessionStorage.setItem("username", username);
        sessionStorage.setItem("password", password);
      }

      // Ricarica la pagina per attivare la visualizzazione
      location.reload();
    } else {
      const msg = document.getElementById("loginMessage");
      msg.style.display = "block";
      msg.textContent = "Credenziali non valide.";
    }
  });

  function logout() {
    sessionStorage.removeItem("username");
    sessionStorage.removeItem("password");
    location.reload();
  }
</script>

</body>
</html>
