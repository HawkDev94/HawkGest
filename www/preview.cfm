<cfset inputFile = expandPath("/uploads/123.dxf")>
<cfset outputFile = expandPath("/uploads/123.pdf")>

<cfexecute name="/usr/bin/inkscape"
    arguments="--export-type=pdf --export-filename=#outputFile# #inputFile#"
    timeout="30"
    variable="result"
    errorVariable="errorResult">
</cfexecute>

<cfoutput>
  <h3>STDOUT</h3>
  <pre>#htmlEditFormat(result)#</pre>

  <h3>STDERR</h3>
  <pre>#htmlEditFormat(errorResult)#</pre>
</cfoutput>
