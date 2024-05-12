<cfif structKeyExists(session, "Auth")
  && len(trim(session?.userName))
>
  <cflocation url = "/index.cfm?action=home.taskList" addtoken="false">
</cfif>
<cfinclude template = "./js/jsUserDetails.cfm">
<cfoutput>
  <div class="col-xs-12">
    <div class="col-xs-12 d-flex justify-content-center">
      <div class="col-xs-3 m-3">
        User Full Name :
        <span><input type = "text" id = "userName" required = "true" class="form-control" placeholder="User full name"></span>
      </div>
      <div class="col-xs-3 m-3">
        Enter Email Address:
        <span><input type = "text" id = "userEmail" required = "true" class="form-control" placeholder="Enter email address"></span>
      </div>
    </div>
    <div class="col-xs-12 d-flex m-1 justify-content-center errorMsg">
      <span id="errorMsg" class="text-danger"></span>
    </div>
    <div class="col-xs-12 d-flex m-1 justify-content-center errorMsg">
      <span id="errorMsg" class="text-danger"></span>
    </div>
    <div class="col-xs-12 d-flex justify-content-center">
      <a id="addUser" onClick = "checkIN()" class="btn btn-sm btn-primary">Check IN</a>
    </div>
  </div>
</cfoutput>