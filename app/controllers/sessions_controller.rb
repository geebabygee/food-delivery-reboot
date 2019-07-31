require_relative "../../app/views/sessions_view"
require "byebug"
class SessionsController
  def initialize(employee_repo)
    @view = SessionsView.new
    @employee_repo = employee_repo
  end

  def sign_in
    #1. Ask user for username and password(view)
    username = @view.ask_for("username")
    password = @view.ask_for("password")
    #2. Find employee with username(repo)
    employee = @employee_repo.find_by(username)
    #3. Compare the password given with the one in our DB(model)
    if employee && employee.password == password
    #4. Sign in - Welcome user.
      @view.signed_in_successfully(employee)
      return employee
    else
      @view.wrong_credentials
      sign_in # Recursive call
    end
  end


end
