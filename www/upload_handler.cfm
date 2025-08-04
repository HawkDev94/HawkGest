<cfif structKeyExists(form, "cadFile")>
  <!--- Salva il file su disco temporaneamente --->
  <cffile 
    action="upload" 
    filefield="cadFile" 
    destination="#expandPath('./uploads/')#" 
    nameconflict="makeunique"
    result="uploadResult">

  <!--- Validazione estensione (opzionale ma consigliata) --->
  <cfset validExtensions = "dxf,dwg">
  <cfset fileExt = listLast(uploadResult.clientFile, ".")>

  <cfif NOT listFindNoCase(validExtensions, fileExt)>
    <p>❌ Estensione non valida: .#fileExt#</p>
    <cfabort>
  </cfif>

  <!--- Leggi il file in binario --->
  <cffile 
    action="readBinary" 
    file="#uploadResult.serverDirectory#/#uploadResult.serverFile#" 
    variable="fileBinary">

  <!--- Salva nel database --->
  <cfquery>
    INSERT INTO files_dxf (filename, content_type, file_data)
    VALUES (
      <cfqueryparam value="#uploadResult.clientFile#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#uploadResult.serverfileext#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#fileBinary#" cfsqltype="cf_sql_longvarbinary">
    )
  </cfquery>

  <p>✅ File <strong><cfoutput>#uploadResult.clientFile#</cfoutput></strong> caricato con successo!</p>
<cfelse>
  <p>⚠️ Nessun file selezionato.</p>
</cfif>
