<cfset rc.title = "Default View" />	<!--- set a variable to be used in a layout --->
<p>This is the default view for FW/1.</p>
<!--- use the named result from the service call --->
<p>This page was rendered on <cfoutput>#rc.today#</cfoutput>.</p>
<cfscript>
  if(
    !(
      structKeyExists(session, "Auth")
      || len(trim(session?.userName))
    )
  ){
    cflocation(
      url = "/index.cfm?action=home.userDetails"
    );
  }
</cfscript>
<cflocation url = "/index.cfm?action=home.taskList">