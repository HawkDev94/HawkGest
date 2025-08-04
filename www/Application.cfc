
component {

  // Proprietà dell'applicazione
  this.name = "HawkGest"; // nome univoco per l'app
  this.sessionManagement = true; // abilita sessioni
  this.customTagPaths = [expandPath("customtags")]; // path ai tuoi custom tags
  //this.datasource = "HawkGestDS";
   this.datasources["HawkGestDS"] = {
    class: "com.mysql.cj.jdbc.Driver",
    bundleName: "com.mysql.cj",
    bundleVersion: "8.0.33",
    connectionString: "jdbc:mysql://localhost:3306/HawkGest?useSSL=false",
    username: "root",
    password: ""
  };

  this.datasource = "HawkGestDS";

  // opzionale: funzione chiamata all'avvio della richiesta
  public boolean function onRequestStart(string targetPage) {
    aaa
    if (listLast(arguments.targetPage, ".") eq "cfc") {
      // Utente non autenticato
      if (!structKeyExists(session, "authenticated") || session.authenticated neq true) {
        // Restituisce un errore JSON leggibile dal frontend
        writeOutput(serializeJSON({error=true, message="Accesso negato: non autenticato"}));
        cfheader(statusCode="403", statusText="Forbidden");
        cfcontent(type="application/json");
        return false; // blocca la richiesta
      }
    }
    return true; // se ritorni false, la richiesta si blocca
  }
  
  // Inizializzazione (opzionale)
  function onApplicationStart() {
    // Qui puoi mettere codice che deve girare all’avvio dell’app    
    return true;
  }

}
