component extends="framework.one" {

	/*
		This is provided for illustration only - YOU SHOULD NOT USE THIS IN
		A REAL PROGRAM! ONLY SPECIFY THE DEFAULTS YOU NEED TO CHANGE!*/

  this.name = "taskManagementSystem";

	function setupRequest() {
		// use setupRequest to do initialization per request
		request.context.startTime = getTickCount();
	}

  function onError(exception, eventname) {
    savecontent variable="errortext" {
      writeOutput("An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#");
      writeOutput("Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#");
      writeDump(var=arguments.exception, label="Error");
      /*writeDump(var="#session#" label="Session Variables");*/
      writeDump(var=form, label="Form");
      writeDump(var=url, label="URL");
      writeDump(var=CGI, label="CGI");
      if(StructKeyExists(CGI, 'HTTP_X_FORWARDED_FOR')){
        writeOutput("REMOTE IP: #cgi.HTTP_X_FORWARDED_FOR#");
      }
    }
    mail=new mail();
    mail.setSubject("Ajax Error");
    mail.setTo("errors@bistraining.ca,rejith.r@techversantinfotech.com");
    mail.setFrom("error@bistrainer.com");
    mail.addPart(type="html", charset="utf-8", body="#errortext#");
    mail.send();
    throw(object="#arguments.exception#");
  }

}