<cfsetting showdebugoutput="false">
<cfcontent type="application/json">

  <!-- Connessione al DB -->
  <cfquery name="qClienti">
    SELECT `machines`.`id`,
        `machines`.`machine`,
        `machines`.`id_type`,
        `machines`.`date_insert`,
        `machines`.`serial`,
        `machines`.`year`
    FROM `HawkGest`.`machines`;

  </cfquery>

  <!-- Trasformazione in array di struct -->
  <cfset risultati = []>
  <cfloop query="qClienti">
    <cfset arrayAppend(risultati, {
      "id" = qClienti.id,
      "nome" = qClienti.machine,
      "matricola" = qClienti.serial
    })>
  </cfloop>

  <!-- Output JSON -->
  <cfoutput>#serializeJSON(risultati)#</cfoutput>

