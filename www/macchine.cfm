<cf_header
pChoose="5">
  
  <cfquery name="aoMacchine" returntype="array">
    select * from machines as m 
      inner join machine_types as mt on m.id_type=mt.id;
  </cfquery> 

  <!-- Contenuto principale -->
  <div class="container">
    <div class="position-relative">
      <h1 class="mb-4">Macchine di Officina</h1>
      <button type="button" class="position-absolute top-0 end-0 btn btn-primary mt-3" data-bs-toggle="modal" data-bs-target="#macchinaUtensileModal">Aggiungi Nuova Macchina Utensile</button>
    </div>
    
    
    <!-- Tabella delle macchine -->
    <div class="table-responsive">
      <table class="table table-bordered table-striped align-middle" id="macchineTable">
        <thead class="table-dark">
          <tr>
            <th>ID</th>
            <th>Nome macchina</th>
            <th>Tipo</th>
            <th>Stato</th>
            <th>Ultima manutenzione</th>
            <th>Prossima manutenzione</th>
          </tr>
        </thead>
        <tbody>
          <cfloop array="#aoMacchine#" index="macchina">
            <tr>
              <td><cfoutput>#macchina.id#</cfoutput></td>
              <td><cfoutput>#macchina.machine#</cfoutput></td>
              <td><cfoutput>#macchina.machine_types#</cfoutput></td>
              <td><span class="badge bg-success">Operativa</span></td>
              <td>2025-05-10</td>
              <td>2025-05-10</td>
            </tr>
          </cfloop>
        </tbody>
      </table>
    </div>
  </div>

  <cfset aoData=[
    {label="Nome macchina", inputtype="text", inputid="nome", inputname="nome", required=true}
    ,{label="Matricola", inputtype="text", inputid="serial", inputname="serial", required=true}
    ,{label="Tipo Macchina", inputtype="select", inputid="machinetype", inputname="machinetype", option=[{nome="Laser", id="1"}, {nome="Piegatrice", id="2"}, {nome="Saldatrice", id="3"}]}
  ]>
  
  <cf_modal
    pIdform="macchinaUtensileModal"
    aoField="#aoData#">

  <script src="scripts/macchine.js"></script>
<cf_footer>