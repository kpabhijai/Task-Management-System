component accessors="true" extends="ajaxbase"{

  remote void function createAUser(rc){
    try {
      if(len(trim(rc?.name))) {
        rc.response = apiProcessHandlerService.createAUser(name = rc.name);
      } else {
        rc.response = {"error" : true};
      }
    }catch(any e){
      rc.response = {"error" : true};
      mailServiceService.sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      )
    }
  }

  remote void function createATask(rc){
    try {
      if(
        len(trim(rc?.taskName))
        && len(trim(rc?.status))
      ) {
        rc.response = apiProcessHandlerService.createATask(
          argStruct = {
            "taskName" : rc.taskName,
            "status" : rc.status
          }
        );
      } else {
        rc.response = {"error" : true};
      }
    }catch(any e){
      rc.response = {"error" : true};
      mailServiceService.sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      )
    }
  }

  remote void function updateTask(rc){
    try {
      if(len(trim(rc?.Id))) {
        rc.response = apiProcessHandlerService.updateTask(
          Id = rc.Id,
          taskName = trim(rc?.taskName),
          status = trim(rc?.status),
          userId = val(rc?.assignedTo)
        );
      } else {
        rc.response = {"error" : true};
      }
    } catch(any e) {
      rc.response = {"error" : true};
      mailServiceService.sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      )
    }
  }

  remote void function checkIN(rc){
    try {
      if(
        len(trim(rc?.userName))
        && len(trim(rc?.userEmail))
      ) {
        rc.response = apiProcessHandlerService.checkIN(
          userName = trim(rc?.userName),
          userEmail = trim(rc?.userEmail)
        );
      } else {
        rc.response = {"error" : true};
      }
    } catch(any e) {
      rc.response = {"error" : true};
      mailServiceService.sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      )
    }
  }

  remote void function deleteUser(rc){
    try {
      if(len(trim(rc?.Id))) {
      rc.response = apiProcessHandlerService.deleteUser(
          Id = rc.Id
        );
      } else {
        rc.response = {"error" : true};
      }
    } catch(any e) {
      rc.response = {"error" : true};
      mailServiceService.sendErrorMail(
        subject = "Error at #getFunctionCalledName()#",
        exception = e
      )
    }
  }
}