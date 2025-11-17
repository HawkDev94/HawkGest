<cf_header
pChoose="5">
  
  <cfset tabContent = 
    [{title: "Macchine", target:"machines", class:"show active", contentType: 1, content:"macchineTab.cfm"}
    ,{title: "Manutenzione", target:"dash", class:"no-active", contentType: 0, content:"Lista manutenzioni…"}]>

<cf_htabs
aContent="#tabContent#">

  <script src="scripts/macchine.js"></script>
<cf_footer>