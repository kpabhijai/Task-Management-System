<cfinclude template = "./css/cssTaskList.cfm">
<cfinclude template = "./js/jsTaskList.cfm">
<cfoutput>
  <div class="col-xs-12 m-3 d-flex">
    <div class="">
      Search : <span><input type = "text" id = "search"></span>
    </div>
    <div class="mx-3">
      <button type="button" class="btn btn-sm btn-primary">Submit</button>
    </div>
    <div class="mx-3">
      <a href="#buildUrl("home.createTask")#" class="btn btn-sm btn-success">Create Task</a>
      <a href="#buildUrl("home.createUser")#" class="btn btn-sm btn-primary">Create User</a>
      <a href="#buildUrl("home.taskList")#" class="btn btn-sm btn-success "> Task List</a>
    </div>
  </div>
  <div class = "col-md-12 p-3 table-container">
    <table border class = "col-10 text-center p-2 mx-auto">
      <thead>
        <tr>
          <th>ID</th>
          <th>User</th>
          <th>Action</th>
      </thead>
      <tbody class = "table-body">
        <cfif structKeyExists(rc, "userList")
          AND arrayLen(rc.userList)
        >
          <cfloop array="#rc.userList#" item = "variables.item" index="vairables.index">
            <tr>
              <td>#variables.item.userId#-#vairables.index#</td>
              <td>#variables.item.userName#</td>
              <td><a onclick="deleteUser(#variables.item.userId#)" class="btn btn-sm btn-danger">Delete</a></td>
            </tr>
          </cfloop>
        <cfelse>
          <tr><td>No Users</td></tr>
        </cfif>
      </tbody>
    </table>
  </div>
</cfoutput>