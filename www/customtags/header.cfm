<cfparam name="attributes.pChoose" default="0">
<cfset session.authenticated = true>

<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Gestionale Produzione Metalmeccanica</title>
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <!-- Tabulator CSS -->
  <link href="https://unpkg.com/tabulator-tables@5.5.0/dist/css/tabulator.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/styles/tabulator.css">
  <link rel="stylesheet" href="/styles/menu.css">
  <link rel="stylesheet" href="/styles/style.css">
  <!-- Tabulator JS -->
  <script src="https://unpkg.com/tabulator-tables@5.5.0/dist/js/tabulator.min.js"></script>
  <script src="scripts/app.js"></script>
</head>
<body>

  <div class="layout">
<cf_menu-v
  pChoose="#attributes.pChoose#">

   <!-- MAIN CONTENT -->
    <main class="content">