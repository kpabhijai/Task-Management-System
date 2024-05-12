component {
  public void function sendErrorMail(
    required string subject
  ) {
    cfmail(
      from = "error@demoCompany.com",
      to = "errorHanlder@example.com",
      subject="#arguments.subject#"
    ) {
      writeDump(arguments.exception)
    }
  }
}