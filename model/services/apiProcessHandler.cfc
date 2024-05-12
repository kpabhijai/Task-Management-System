component extends = "mailService" {
  public struct function createAUser(
    required string name
  ) {
    local.result = {"error" : false};
    try {
      queryExecute("
        INSERT INTO tbluser(
          fldName
        ) VALUES (
          :name
        )
        ", {
          name : {value : arguments.name, cfsqltype : "varchar"}
        }, {datasource : "TaskManagementSystem"}
      );
    } catch (any e) {
      local.result.error = "true";
      sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      )
    }
    return local.result;
  }

  public struct function createATask(
    required struct argStruct
  ) {
    local.result = {"error" : false};
    try {
      queryExecute("
        INSERT INTO tbltasks(
          fldName,
          fldStatus
        ) VALUES (
          :taskName,
          :status
        )
        ", {
          taskName : {value : arguments.argStruct.taskName, cfsqltype : "varchar"},
          status : {value : arguments.argStruct.status, cfsqltype : "varchar"}
        }, {datasource : "TaskManagementSystem"}
      );
    } catch (any e) {
      local.result.error = "true";
      sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      )
    }
    return local.result;
  }

  public struct function updateTask(
    required numeric id,
    string taskName = "",
    string status = "",
    numeric userId = 0
  ) {
    local.result = {"error" : false};
    local.fieldsToUpdate = "";
    try {
      if(
        arguments.id
        && !len(trim(arguments.taskName))
      ) {
        local.fieldsToUpdate = " ,fldActive = 0";
      } else if(
        len(trim(arguments.taskName))
        && len(trim(arguments.status))
      ) {
        local.fieldsToUpdate = " ,fldName = :taskName,fldStatus = :status,fldUserId = :userId";
      }
      if(len(trim(local.fieldsToUpdate))) {
        queryExecute("
          UPDATE tbltasks
          SET fldModifiedDate = now()
          #local.fieldsToUpdate#
          WHERE fldTask_Id = :id
          ", {
            id : {value : arguments.id, cfsqltype : "integer"},
            status : {value : trim(arguments?.status), cfsqltype : "varchar"},
            taskName : {value : trim(arguments?.taskName), cfsqltype : "varchar"},
            userId : {value : val(arguments?.userId), cfsqltype : "integer"}
          }, {
          datasource : "TaskManagementSystem"
        });
      }
    } catch (any e) {
      local.result.error = "true";
      sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      );
    }
    return local.result;
  }

  public struct function deleteUser(
    required numeric id
  ) {
    local.result = {"error" : false};
    try {
      queryExecute("
        UPDATE tbluser
        SET fldModifiedDate = now(),
          fldActive = 9
        WHERE flduser_Id = :id
        ", {
          id : {value : arguments.id, cfsqltype : "integer"}
        }, {
        datasource : "TaskManagementSystem"
      });
    } catch (any e) {
      local.result.error = "true";
      sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      );
    }
    return local.result;
  }

  public struct function checkIN(
    required string userName,
    required string userEmail
  ) {
    local.result = {"error" : false};
    try {
      if(isValid("email", arguments.userEmail)) {
        session["Auth"] = true;
        session["userName"] = arguments.userName
        session["userEmail"] = arguments.userEmail
        local.result["Auth"] = true
      } else {
        local.result.error = "true";
      }
    } catch (any e) {
      local.result.error = "true";
      sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      );
    }
    return local.result;
  }
}