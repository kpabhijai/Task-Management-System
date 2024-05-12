<cfinclude template = "./css/cssTaskList.cfm">
<cfinclude template = "./js/jsTaskList.cfm">
<cfoutput>
  <div class="col-xs-12">
    <div class="col-xs-12 d-flex my-3 justify-content-center">
      <a href="#buildUrl("home.taskList")#" class="btn btn-success mx-3"> Task List</a>
      <a href="#buildUrl("home.createTask")#" class="btn btn-primary">Create Task</a>
      <a href="#buildUrl("home.userList")#" class="btn btn-secondary mx-3">User List</a>
    </div>
    <div class="col-xs-12 d-flex justify-content-center">
      <div class="col-xs-3 m-3">
        User Full Name :
        <span><input type = "text" id = "userName" required = "true" class="form-control" placeholder="User Full Name"></span>
      </div>
    </div>
    <div class="col-xs-12 d-flex m-1 justify-content-center errorMsg">
      <span id="errorMsg" class="text-danger"></span>
    </div>
    <div class="col-xs-12 d-flex justify-content-center">
      <a id="addUser" onClick = "addUser()" class="btn btn-sm btn-primary">Add User</a>
    </div>
  </div>
</cfoutput>