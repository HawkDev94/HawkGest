<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuovo Prodotto - Gestione Articoli</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLMDJd4qFf3A6vH2P5aX5t0f4t9k/3K7sXyFm5w1g4q1s2/d55wWvR0p3f4D+A+g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-7">
                
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0"><i class="fas fa-tools me-2"></i> Inserimento Nuovo Articolo</h4>
                    </div>
                    <div class="card-body">
                        
                        <form action="salva_prodotto.cfm" method="POST" enctype="multipart/form-data">
                            
                            <div class="mb-3">
                                <label for="nomeArticolo" class="form-label fw-bold">Nome Articolo / Codice</label>
                                <input type="text" class="form-control" id="nomeArticolo" name="nomeArticolo" required>
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

                            <hr class="my-4">
                            <h5 class="mb-3 text-secondary">Documenti Tecnici (CAD)</h5>

                            <div class="mb-3">
                                <label for="fileDxf" class="form-label fw-bold">File DXF (Obbligatorio)</label>
                                <input class="form-control" type="file" id="fileDxf" name="fileDxf" accept=".dxf" required>
                            </div>

                            <div class="mb-3">
                                <label for="fileDwg" class="form-label fw-bold">File DWG (Opzionale)</label>
                                <input class="form-control" type="file" id="fileDwg" name="fileDwg" accept=".dwg">
                            </div>
                            
                            <div class="d-grid gap-2 mt-5">
                                <button type="submit" class="btn btn-success btn-lg">
                                    <i class="fas fa-upload me-2"></i> Invia Prodotto e File
                                </button>
                            </div>
                            
                        </form>
                        
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2OFfWcFFwE5g0+Y4lJz6z0L1I1I2R6F4U4L5/Jz+C5E4ZJtP8LzJ1F7D7K4E4B5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function() {
            // Seleziona tutti gli elementi con la classe 'select2-enabled' e li inizializza
            $('.select2-enabled').select2({
                theme: "bootstrap-5", // Opzionale: per una migliore integrazione estetica con Bootstrap
                width: '100%'
            });
        });
    </script>
</body>
</html>