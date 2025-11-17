<cfparam name="attributes.aContent" default="#[{}]#">

<div class="container py-5">

  <!-- TABS ORIZZONTALI -->
  <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">

     <cfloop array="#attributes.aContent#" index="aTab">
        <li class="nav-item" role="presentation">
          <button class="nav-link <cfoutput>#aTab.class#</cfoutput>" id="<cfoutput>#aTab.target#</cfoutput>-tab" data-bs-toggle="tab" data-bs-target="#<cfoutput>#aTab.target#</cfoutput>" type="button" role="tab">
            <cfoutput>#aTab.title#</cfoutput>
          </button>
        </li>
    </cfloop>
  </ul>

  <!-- CONTENUTO -->
  <div class="tab-content" id="myTabContent">
    <cfloop array="#attributes.aContent#" index="aTabContent">
      <div class="tab-pane fade <cfoutput>#aTabContent.class#</cfoutput>" id="<cfoutput>#aTabContent.target#</cfoutput>" role="tabpanel">
       <cfif aTabContent.contentType EQ 1>   <!-- custom -->
        <cfmodule template="#aTabContent.content#">

       <cfelse>
        <cfoutput>#aTabContent.content#</cfoutput>
       </cfif>  
      </div>
    </cfloop> 



<!-- CONTENUTO
    <div class="tab-pane fade" id="machines" role="tabpanel">
      <h3>Macchinari</h3>
      <p>Lista macchinari, stati, manutenzioni…</p>
    </div>

    <div class="tab-pane fade" id="orders" role="tabpanel">
      <h3>Ordini</h3>
      <p>Tabella ordini, avanzamento lavoro…</p>
    </div>

    <div class="tab-pane fade" id="users" role="tabpanel">
      <h3>Utenti</h3>
      <p>Gestione operatori, ruoli, permessi…</p>
    </div> -->

  </div>
</div>