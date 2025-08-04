<cfcomponent displayName="interface" output="false">
  
  <cffunction name="onCfcRequest" access="remote" returntype="any" output="false">
  <cfargument name="targetFunction" type="string" required="true">
  <cfargument name="argumentCollection" type="struct" required="true">

  <cfscript>
      try {
        if (!structKeyExists(session, "authenticated") || session.authenticated neq true) {
          throw(type="Security", message="Utente non autenticato");
        }
        return invoke(this, arguments.targetFunction, arguments.argumentCollection);
      } catch (any e) {
        // Risposta JSON con errore
        writeOutput(serializeJSON({error=true, message=e.message}));
        cfabort;
      }
    </cfscript>
  </cffunction>

</cfcomponent>
