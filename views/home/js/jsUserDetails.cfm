<cfoutput>
  <script type="text/javascript">
    function checkIN() {
      var userName = $("##userName").val();
      var userEmail = $("##userEmail").val();
      if(id) {
        alert("The User will be deleted.")
        $.ajax({
          type: "post",
          url	: "#buildUrl("ajaxProcessHandler.checkIN")#&userName=" + userName + "&userEmail=" + userEmail,
          success: function(data){
            if(!data.error){
              location.reload();
            }
          }
        });
      }
    }
  </script>
</cfoutput>