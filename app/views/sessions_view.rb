require_relative "base_view"

class SessionsView < BaseView #inherits from BaseView

  def signed_in_successfully(employee)
    if employee.manager?
      puts "-----------------"
      puts "-----------------"
      puts "Well hellooooo #{employee.username.capitalize}! Did you lose some weight, you're looking great!"
    else
      puts "-----------------"
      puts "-----------------"
      puts "#{employee.username.capitalize} Get to work, you're late!!!"
    end
  end

  def wrong_credentials
    puts "Wrong credentials, try again!!"
  end

end
