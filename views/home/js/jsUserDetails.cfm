<cfoutput>
  <script type="text/javascript">
    function checkIN() {
      var userName = $("##userName").val();
      var userEmail = $("##userEmail").val();
      if(
        userName
        && userEmail
      ) {
        $.ajax({
          type: "post",
          url	: "#buildUrl("ajaxProcessHandler.checkIN")#&userName=" + userName + "&userEmail=" + userEmail,
          success: function(data){
            if(!data.error){
              location.reload();
            }
          }
        });
      } else {
        $("##errorMsg").text("Invalid user details.");
        $('##errorMsg').addClass('text-danger');
        $('##errorMsg').removeClass('text-success');
      }
    }
  </script>
</cfoutput>