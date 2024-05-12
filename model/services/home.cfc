component extends = "mailService" {
  public struct function getTaskList(
    numeric id = 0,
    string searchText = ""
  ) {
    local.result = {
      "error" : false,
      "taskList" : []
    }
    local.whereCondition = arguments.id
      ? " AND T.fldTask_Id = :id"
      : "";
    if(len(trim(arguments.searchText))) {
      local.whereCondition = local.whereCondition & " AND (
        T.fldName LIKE :searchText
        OR T.fldStatus LIKE :searchText
        OR U.fldName LIKE :searchText
      )"
    }
    try {
      local.getTasks = queryExecute("
        SELECT
          T.fldTask_Id,
          T.fldName,
          T.fldStatus,
          T.fldCreatedDate,
          T.fldModifiedDate,
          U.fldName AS assignedTo,
          U.fldUser_Id
        FROM
          tblTasks T
          LEFT JOIN tblUser U ON U.flduser_ID = T.fldUserId
            AND U.fldActive = 1
        WHERE
          T.fldActive = 1
          #local.whereCondition#
        ", {
          id : {value : arguments.id, cfsqltype : "integer"},
          searchText : {value : "%#arguments.searchText#%", cfsqltype : "varchar"}
        }, {datasource : "TaskManagementSystem"}
      );
      if(local.getTasks.recordCount) {
        for(local.item in local.getTasks) {
          local.status = "";
          if(local.item.fldStatus == "InProgress") {
            local.status = "In Progrees";
          } else if(local.item.fldStatus == "CodeReview") {
            local.status = "Code Review";
          } else {
            local.status = local.item.fldStatus;
          }
          arrayAppend(local.result.taskList, {
            "taskId" : local.item.fldTask_Id,
            "taskName" : trim(local.item.fldName),
            "status" : trim(local.item.fldStatus),
            "statusLabel" : local.status,
            "userName" : trim(local.item.assignedTo),
            "assignedTo" : val(local.item.fldUser_Id),
            "lastModifiedDate" : len(trim(local.item.fldModifiedDate))
              ? dateTimeFormat(local.item.fldModifiedDate, "yyyy-mm-dd hh:mm:ss")
              : dateTimeFormat(local.item.fldCreatedDate, "yyyy-mm-dd hh:mm:ss")
            }
          );
        }
      }
    } catch (any e) {
      local.result.error = "true";
    }
    return local.result;
  }

  public struct function getUserList() {
    local.result = {
      "error" : false,
      "userList" : []
    }
    try {
      local.getUser = queryExecute("
        SELECT
          fldUser_Id,
          fldName
        FROM
          tblUser
        WHERE
          fldActive = 1
        ", {}, {datasource : "TaskManagementSystem"}
      );
      if(local.getUser.recordCount) {
        for(local.item in local.getUser) {
          arrayAppend(local.result.userList, {
            "userId" : local.item.fldUser_Id,
            "userName" : trim(local.item.fldName)
            }
          );
        }
      }
    } catch (any e) {
      local.result.error = "true";
    }
    return local.result;
  }

  public struct function getTaskStatus() {
    local.result = {
      "error" : false,
      "status" : [
        {"value" : "Unassigned", "label" : "Unassigned"},
        {"value" : "InProgress", "label" : "In Progress"},
        {"value" : "CodeReview", "label" : "Code Review"},
        {"value" : "Hold", "label" : "Hold"}
      ]
    };
    return local.result;
  }
}