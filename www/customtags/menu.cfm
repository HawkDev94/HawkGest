<cfparam name="attributes.pChoose" default="0">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container-fluid">
      
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">
          <img src="/media/img/hawkgest_logo_small-nobg.png" height="80" class="d-inline-block" alt="HawkGest Logo">
          HawkGest
        </a>
      </nav>


      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navMenu">
        <ul class="navbar-nav me-auto">
          <li class="nav-item"><a class="nav-link <cfif attributes.pChoose EQ 1>active</cfif>" href="dashboard.cfm">Dashboard</a></li>
          <li class="nav-item"><a class="nav-link <cfif attributes.pChoose EQ 6>active</cfif>" href="articoli.cfm">Articoli</a></li>
          <li class="nav-item"><a class="nav-link <cfif attributes.pChoose EQ 2>active</cfif>" href="ordini.cfm">Ordini</a></li>
          <li class="nav-item"><a class="nav-link <cfif attributes.pChoose EQ 3>active</cfif>" href="magazzino.cfm">Magazzino</a></li>
          <li class="nav-item"><a class="nav-link <cfif attributes.pChoose EQ 4>active</cfif>" href="operai.cfm">Operai</a></li>
		      <li class="nav-item"><a class="nav-link <cfif attributes.pChoose EQ 5>active</cfif>" href="macchine.cfm">Macchine</a></li>
        </ul>

        <div id="logoutArea" class="d-flex align-items-center" style="display: none;">
          <span class="text-white me-3" id="userWelcome"></span>
          <button class="btn btn-outline-light btn-sm" onclick="logout()">Logout</button>
        </div>
      </div>
    </div>
  </nav>