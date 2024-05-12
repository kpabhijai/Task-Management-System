<div class = "col-xs-12 text-center pageHeaderContainer p-3">
  Task Management System
</div>
<div class = "col-xs-12 text-center">
  <cfif structKeyExists(session, "Auth")
    AND session.Auth
    AND len(trim(session.userName))
  >
    <cfoutput>Logged In user : #session.userName#<a href="#buildUrl("home.logOut")#" class="btn btn-sm btn-danger mx-3 my-1">Log out</a></cfoutput>
  </cfif>
</div>