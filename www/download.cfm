<cfparam name="url.id" default="1">

<cfquery name="getFile">
  SELECT * FROM files_dxf WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif getFile.recordCount EQ 1>
  <cfheader name="Content-disposition" value="attachment; filename=#getFile.filename#">
  <cfcontent type="#getFile.content_type#" variable="#getFile.file_data#">
<cfelse>
  <p>⚠️ File non trovato.</p>
</cfif>
