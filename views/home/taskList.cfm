<cfinclude template = "./css/cssTaskList.cfm">
<cfinclude template = "./js/jsTaskList.cfm">
<cfscript>
  if(
    !(
      structKeyExists(session, "Auth")
      || len(trim(session?.userName))
    ) && !url.action == "home.userDetails"
  ){
    location(
      url = "/index.cfm?action=home.userDetails",
      addtoken = "no"
    );
  }
</cfscript>
<cfoutput>
  <div class="col-xs-12 m-3 d-flex">
    <div class="">
      Search : <span><input type = "text" value="#trim(url?.searchText)#" id = "searchText"></span>
    </div>
    <div class="mx-3">
      <button onclick = "searchTask()" class="btn btn-sm btn-primary">Submit</button>
    </div>
    <div class="mx-3">
      <a href="#buildUrl("home.createTask")#" class="btn btn-sm btn-success">Create Task</a>
      <a href="#buildUrl("home.createUser")#" class="btn btn-sm btn-primary">Create User</a>
      <a href="#buildUrl("home.userList")#" class="btn btn-sm btn-secondary">User List</a>
    </div>
  </div>
  <div class = "col-md-12 p-3 table-container">
    <table border class = "col-10 text-center p-2 mx-auto">
      <thead>
        <tr>
          <th>Task</th>
          <th>ID</th>
          <th>Assigned To</th>
          <th>Last Acrivity</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody class = "table-body">
        <cfif structKeyExists(rc.response, "taskList")
          AND arrayLen(rc.response.taskList)
        >
          <cfloop array="#rc.response.taskList#" item = "variables.item" index="vairables.index">
            <tr>
              <td>
                #variables.item.taskName#
              </td>
              <td>
                #variables.item.taskId#-#vairables.index#
              </td>
              <td>
                #variables.item.userName#
              </td>
              <td>
                #variables.item.lastModifiedDate#
              </td>
              <td>
                #variables.item.statusLabel#
              </td>
              <td>
                <a href="#buildUrl("home.editTask")#&id=#variables.item.taskId#" class="btn btn-sm btn-success">Edit</a>
                <a onclick="deleteTask(#variables.item.taskId#)" class="btn btn-sm btn-danger">Delete</a>
              </td>
            </tr>
          </cfloop>
        <cfelse>
          <tr><td>No tasks</td></tr>
        </cfif>
      </tbody>
    </table>
  </div>
</cfoutput>