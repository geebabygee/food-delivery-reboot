class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      user_choice = display_menu
      print `clear`
      action(user_choice)
    end
  end

  def display_menu
    puts "-----------------"
    puts "------MENU-------"
    puts "-----------------"
    puts "What would you like to do?"
    puts "1. List meals"
    puts "2. Add a meal"
    puts "3. Add a customer"
    puts "4. List customer"
    puts "9. Quit program"
    print ">"

    gets.chomp.to_i
  end

  def action(user_choice)
    case user_choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then @running = false
    else
      puts "Wrong choice, try again"
    end
  end









end
