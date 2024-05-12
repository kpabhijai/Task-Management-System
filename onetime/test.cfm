<cfoutput>
    <cfset variables.fwDummy =  new fwDummy()>
    <cfdump var="#createObject("component", "model/services.home").init(fw = variables.fwDummy)#">
</cfoutput>