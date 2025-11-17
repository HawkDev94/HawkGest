 <cfparam name="attributes.pChoose" default="0">
 <!-- SIDEBAR -->
<aside class="sidebar">
    <div class="logo">
      <a class="navbar-brand" href="/">
          <img src="/media/img/hawkgest_logo_small-nobg.png" height="80" class="d-inline-block bg-white" alt="HawkGest Logo">
          HawkGest
        </a>
      </div>

    <nav class="menu">
       <a class="nav-link <cfif attributes.pChoose EQ 1>active</cfif>" href="dashboard.cfm">Dashboard</a>
       <a class="nav-link <cfif attributes.pChoose EQ 6>active</cfif>" href="articoli.cfm">Articoli</a>
       <a class="nav-link <cfif attributes.pChoose EQ 2>active</cfif>" href="ordini.cfm">Ordini</a>
       <a class="nav-link <cfif attributes.pChoose EQ 3>active</cfif>" href="magazzino.cfm">Magazzino</a>
       <a class="nav-link <cfif attributes.pChoose EQ 4>active</cfif>" href="operai.cfm">Operai</a>
		   <a class="nav-link <cfif attributes.pChoose EQ 5>active</cfif>" href="macchine.cfm">Macchine</a>
    </nav>
</aside>
