<cfoutput>
  <script type="text/javascript">
    function addUser() {
      var userName = $("##userName").val();
      if(userName) {
        $("##errorMsg").text("");
        $.ajax({
          type: "post",
          url	: "#buildUrl("ajaxProcessHandler.createAUser")#&name=" + userName,
          success: function(data){
            if(!data.error){
              $("##errorMsg").text("Success");
              $('##errorMsg').addClass('text-success');
              $('##errorMsg').removeClass('text-danger');
              $("##userName").val("");
            } else {
              $("##errorMsg").text("Invalid first name.");
              $('##errorMsg').addClass('text-danger');
              $('##errorMsg').removeClass('text-success');
            }
          }
        });
      } else {
        $("##errorMsg").text("Please enter user full name.");
        $('##errorMsg').addClass('text-danger');
        $('##errorMsg').removeClass('text-success');
      }
    }

    function addTask() {
      var taskName = $("##taskName").val();
      var status = $("##status").val();
      $.ajax({
        type: "post",
        url	: "#buildUrl("ajaxProcessHandler.createATask")#&taskName=" + taskName + "&status=" + status,
        success: function(data){
          if(!data.error){
            $("##errorMsg").text("Success");
            $('##errorMsg').addClass('text-success');
            $('##errorMsg').removeClass('text-danger');
            $("##taskName").val("");
          } else {
            $("##errorMsg").text("Invalid Task Details.");
            $('##errorMsg').addClass('text-danger');
            $('##errorMsg').removeClass('text-success');
          }
        }
      });
    }

    function updateTask(id) {
      var taskName = $("##taskName").val();
      var status = $("##status").val();
      var assignedTo = $("##assignedTo").val();
      if(
        id
        && status
        && taskName
      ) {
        $.ajax({
          type: "post",
          url	: "#buildUrl("ajaxProcessHandler.updateTask")#&taskName=" + taskName + "&status=" + status + "&assignedTo=" + assignedTo + "&id=" + id,
          success: function(data){
            if(!data.error){
              $("##errorMsg").text("Success");
              $('##errorMsg').addClass('text-success');
              $('##errorMsg').removeClass('text-danger');
              $("##taskName").val("");
            } else {
              $("##errorMsg").text("Invalid Task Details.");
              $('##errorMsg').addClass('text-danger');
              $('##errorMsg').removeClass('text-success');
            }
          }
        });
      }
    }

    function deleteTask(id) {
      if(id) {
        alert("Task will be deleted.")
        $.ajax({
          type: "post",
          url	: "#buildUrl("ajaxProcessHandler.updateTask")#&id=" + id,
          success: function(data){
            if(!data.error){
              location.reload();
            }
          }
        });
      }
    }

    function deleteUser(id) {
      if(id) {
        alert("The User will be deleted.")
        $.ajax({
          type: "post",
          url	: "#buildUrl("ajaxProcessHandler.deleteUser")#&id=" + id,
          success: function(data){
            if(!data.error){
              location.reload();
            }
          }
        });
      }
    }

    function searchTask() {
      var searchText = $("##searchText").val();
      location.href = "#buildUrl("home.taskList")#&searchText=" + searchText;
    }
    </script>
</cfoutput>