<cfparam name="attributes.pIdform" default="">
<cfparam name="attributes.pFormtitle" default="">
<cfparam name="attributes.aoField" default="#arrayNew(1)#">

<!-- Modal -->
<div class="modal fade" id="<cfoutput>#attributes.pIdform#</cfoutput>" tabindex="-1" aria-labelledby="macchinaUtensileModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      
      <div class="modal-header">
        <h5 class="modal-title" id="macchinaUtensileModalLabel"><cfoutput>#attributes.pFormtitle#</cfoutput></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Chiudi"></button>
      </div>

      <form id="<cfoutput>#attributes.pIdform#</cfoutput>">
        <div class="modal-body">
      
            <cfloop array="#attributes.aoField#" index="field">
                
                <div class="mb-3">
                <label for="<cfoutput>#field["inputid"]#</cfoutput>" class="form-label"><cfoutput>#field["label"]#</cfoutput></label>
                
                <cfif field["inputtype"] EQ "select">
                    <select class="form-control" id="<cfoutput>#field["inputid"]#</cfoutput>" name="<cfoutput>#field["inputname"]#</cfoutput>">
                        <option value="-1">Seleziona macchina</option>
                        <cfloop array="#field['option']#" index="option">
                            <option value="<cfoutput>#option['id']#</cfoutput>"><cfoutput>#option['nome']#</cfoutput></option>
                        </cfloop>
                    </select>
                <cfelse>
                    <input type="text" class="form-control" id="<cfoutput>#field["inputid"]#</cfoutput>" name="<cfoutput>#field["inputname"]#</cfoutput>" required>
                </cfif>
                </div>                    
            </cfloop>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
          <button type="submit" class="btn btn-primary">Salva</button>
        </div>
      </form>

    </div>
  </div>
</div>
