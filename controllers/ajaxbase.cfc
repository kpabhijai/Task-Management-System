component accessors = "true" {
    property apiProcessHandlerService;
    property mailServiceService;
  
    public any function init(fw) {
      variables.fw = fw;
      return this;
    };
  
    public void function after(rc) {
      request.layout = false;
      variables.fw.setView("main.ajax");
    };
  
  }