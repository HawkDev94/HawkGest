<cf_header
pChoose="6">

<div class="container py-4">
  <h2 class="mb-4">📦 Nuovo Articolo</h2>
  <div class="card-body">
      
      <form action="salva_prodotto.cfm" method="POST" enctype="multipart/form-data">
          
          <div class="mb-3">
              <label for="nomeArticolo" class="form-label fw-bold">Nome Articolo / Codice</label>
              <input type="text" class="form-control" id="nomeArticolo" name="nomeArticolo" placeholder="Es: Staffa Modello A3" required>
          </div>

          <div class="row">
              <div class="col-md-6 mb-3">
                  <label for="materiale" class="form-label fw-bold">Materiale</label>
                  <select class="form-select select2-enabled" id="materiale" name="materiale" required>
                      <option value="">Cerca o seleziona un materiale...</option>
                      <option value="Acciaio_Inox_304">Acciaio Inox AISI 304</option>
                      <option value="Alluminio_6061">Alluminio 6061</option>
                      <option value="Ferro_FE360">Ferro FE360</option>
                      </select>
              </div>
              
              <div class="col-md-6 mb-3">
                  <label for="spessore" class="form-label fw-bold">Spessore (mm)</label>
                  <select class="form-select select2-enabled" id="spessore" name="spessore" required>
                      <option value="">Cerca o seleziona uno spessore...</option>
                      <option value="1.0">1.0 mm</option>
                      <option value="1.5">1.5 mm</option>
                      <option value="2.0">2.0 mm</option>
                      <option value="3.0">3.0 mm</option>
                      </select>
              </div>
          </div>
          
          <hr class="my-4">

          <div class="mb-4">
              <label class="form-label d-block fw-bold">Tipologia di Lavorazione</label>
              
              <div class="p-3 border rounded">
                  <div class="form-check form-check-inline">
                      <input class="form-check-input" type="checkbox" id="taglio" name="lavorazione" value="taglio">
                      <label class="form-check-label" for="taglio">Taglio Laser / Plasma</label>
                  </div>
                  
                  <div class="form-check form-check-inline">
                      <input class="form-check-input" type="checkbox" id="piega" name="lavorazione" value="piega">
                      <label class="form-check-label" for="piega">Piega / Piegatura</label>
                  </div>
                  
                  <div class="form-check form-check-inline">
                      <input class="form-check-input" type="checkbox" id="saldatura" name="lavorazione" value="saldatura">
                      <label class="form-check-label" for="saldatura">Saldatura</label>
                  </div>
                  
                  <div class="form-check form-check-inline">
                      <input class="form-check-input" type="checkbox" id="assemblaggio" name="lavorazione" value="assemblaggio">
                      <label class="form-check-label" for="assemblaggio">Assemblaggio</label>
                  </div>
              </div>
          </div>
          
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
                        <button type="submit" class="btn btn-primary">Carica File</button>
                    </form>
                </div>
            </div>
          
      </form>
      
  </div>
                
</div>

<cf_footer>