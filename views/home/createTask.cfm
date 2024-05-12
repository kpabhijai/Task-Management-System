<cfinclude template = "./css/cssTaskList.cfm">
<cfinclude template = "./js/jsTaskList.cfm">
<cfoutput>
  <div class="col-xs-12">
    <div class="col-xs-12 d-flex my-3 justify-content-center">
      <a href="#buildUrl("home.taskList")#" class="btn btn-success mx-3"> Task List</a>
      <a href="#buildUrl("home.createUser")#" class="btn btn-primary">Create User</a>
      <a href="#buildUrl("home.userList")#" class="btn btn-secondary mx-3">User List</a>
    </div>
    <div class="col-xs-12 d-flex justify-content-center">
      <div class="col-xs-3 m-3">
        Task Name :
        <span><input type = "text" id = "taskName" class="form-control" placeholder="Task Name"></span>
      </div>
      <div class="col-xs-3 m-3">
        Status :
        <select type = "select" id = "status" class="form-select">
          <cfloop array="#rc.taskStatusList#" item="variables.item">
            <option value = "#variables.item.value#">#variables.item.label#</option>
          </cfloop>>
        </select>
      </div>
      <!--- <div class="col-xs-3 m-3">
        Assigned to :
        <span>
          <select type = "select" id = "assignedTo" class="form-select">
            <option >--Select One--</option>
            <cfif arrayLen(rc.userList)>
              <cfloop array="#rc.userList#" item = "variables.item">
                <option value = "#variables.item.userId#">#variables.item.userName#</option>
              </cfloop>
            </cfif>
          </select>
        </span>
      </div> --->
    </div>
    <div class="col-xs-12 d-flex m-1 justify-content-center errorMsg">
      <span id="errorMsg" class="text-danger"></span>
    </div>
    <div class="col-xs-12 d-flex justify-content-center">
      <a id="addUser" onClick = "addTask()" class="btn btn-sm btn-primary">Add Task</a>
    </div>
  </div>
</cfoutput>