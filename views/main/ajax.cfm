<cfsilent>
    <cfset returnJson = 0>
    <cfif Not IsSimpleValue(rc?.response)>
      <cfset returnJson = 1>
      <cfset rc.response = serializeJSON(rc?.response)>
    </cfif>
  </cfsilent><cfif returnJson><cfheader name="Content-Type" value="application/json"></cfif><cfoutput>#rc?.response#</cfoutput>