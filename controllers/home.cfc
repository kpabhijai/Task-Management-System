component accessors="true" {
  property homeService;

  public void function taskList( rc ) {
    rc.response.text = "Task List Page";
    rc.response = homeservice.getTaskList(
      searchText = trim(rc?.searchText)
    );
  }

  public void function createTask( rc ) {
    rc.userList = homeservice.getUserList().userList;
    rc.taskStatus = homeservice.getTaskStatus().status;
    rc.taskStatusList = homeservice.getTaskStatus().status;
  }

  public void function createUser( rc ) {
  }

  public void function userList( rc ) {
    rc.userList = homeservice.getUserList().userList;
  }

  public void function editTask( rc ) {
    local.taskList = homeservice.getTaskList(id = val(rc?.id)).taskList;
    if(arrayLen(local.taskList)) {
      rc.taskId = local.taskList[1].taskId;
      rc.taskStatus = local.taskList[1].status;
      rc.taskName = local.taskList[1].taskName;
      rc.assignedTo = local.taskList[1].assignedTo;
    }
    rc.userList = homeservice.getUserList().userList;
    rc.taskStatusList = homeservice.getTaskStatus().status;
  }

  public void function userDetails( rc ) {
  }

  public void function logOut( rc ) {
    structClear(session);
  }
}
