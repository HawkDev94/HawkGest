<cf_header
pChoose="6">

<cfinvoke method="getProductsDetail" component="/components/products.cfc" returnvariable="rsProductsDetail">
    <cfinvokeargument name="pIdProducts" value="#URL.id#">
</cfinvoke>

<cfquery NAME="rsThickness">
    select t.id
          , m.material
          , t.thickness
      from thickness as t 
        join materials as m on m.id = t.id_material
       order by material, thickness
</cfquery>

<div class="container py-4">
    <h2 class="mb-4">📦 Dettaglio Prodotto</h2>

    <div class="card p-4">
      <div class="row">
        <div class="col-md-8">
          <h4 class="fw-bold mb-1"><cfoutput>#rsProductsDetail.name#</cfoutput></h4>
          <p class="text-muted"><cfoutput>#rsProductsDetail.description#</cfoutput></p>

          <hr>

          <h6 class="fw-semibold">Caratteristiche Tecniche</h6>
          <ul>
            <li>Lavorazione: <strong><cfoutput>#valueList(rsProductsDetail.works_types)#</cfoutput></strong></li>
            <li>Materiale: <strong><cfoutput>#rsProductsDetail.material#</cfoutput></strong> 
                <button id="bt-change-thickness" class="btn btn-secondary btn-sm">✏️</button>
            </li>
            <li>Spessore: <strong><cfoutput>#rsProductsDetail.thickness#</cfoutput> mm</strong></li>
          </ul>

          <div class="mb-3">
            <cfloop query="#rsProductsDetail#">
                <span class="product-tag">#<cfoutput>#rsProductsDetail.works_types#</cfoutput></span>                
            </cfloop>
          </div>
        </div>

        <div class="col-md-4 text-end d-flex flex-column justify-content-between">
          <div>
            <button class="btn btn-primary mb-2 w-100">✏️ Modifica</button>
          </div>     
          
            <!-- Upload Form -->
            <div class="card">
                <div class="card-header">
                 Carica file tecnico (DXF o DWG)
                </div>
                <div class="card-body">
                    <form action="upload_handler.cfm" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                        <label for="cadFile" class="form-label">Seleziona file</label>
                        <input class="form-control" type="file" name="cadFile" id="cadFile" accept=".dxf,.dwg" required>
                        </div>
                        <input type="hidden" name="productId" value="<cfoutput>#url.id#</cfoutput>">
                        <button type="submit" class="btn btn-primary">Carica File</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="mt-4">
            <a href="/articoli.cfm" class="btn btn-secondary">&larr; Torna all'elenco</a>
        </div>
    </div>
</div>
</div>

  <!-- Modale -->
    <div class="modal fade" id="thicknessModal" tabindex="-1" aria-labelledby="thicknessModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="thicknessModalLabel">Modifica Spessore</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Chiudi"></button>
            </div>
            <div class="modal-body">
                <select id="newThickness">
                    <cfloop query="rsThickness">
                        <option value="<cfoutput>#rsThickness.id#</cfoutput>" <cfif rsThickness.id EQ rsProductsDetail.id_thickness>selected</cfif> >                        
                            <cfoutput>#rsThickness.material# - #rsThickness.thickness# mm</cfoutput>
                        </option>    
                    </cfloop>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
                <button type="button" class="btn btn-primary" id="save-thickness">Salva</button>
            </div>
            </div>
        </div>
    </div>

    <script>
    document.getElementById('bt-change-thickness').addEventListener('click', function () {
        var myModal = new bootstrap.Modal(document.getElementById('thicknessModal'));
        myModal.show();
    });

    document.getElementById('save-thickness').addEventListener('click', function () {
        const value = document.getElementById('newThickness').value;
        console.log("Nuovo spessore scelto:", value);
        fetch('/components/products.cfc?method=changeThickness', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'pIdProduct=<cfoutput>#URL.id#</cfoutput>&pIdThickness='+value
        })
        .then(response => response.text())  // o .text() se non è JSON
        .then(data => {
            console.log('OK Risposta dal server:');
            location.reload();            
        })
        .catch(error => {
            console.error('Errore nella chiamata AJAX:', error);
        });

    });
    </script>

<cf_footer>