class Router
  def initialize(meals_controller, customers_controller,sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
    @employee = nil # at first we initialize him as nil but later on when we sign in we capture him
  end

  def run
    @employee = @sessions_controller.sign_in # he exists here, either as biggie or tupac
    while @running
      if @employee.manager?
        user_choice = manager_menu
        print `clear`
        manager_action(user_choice)
      else
        user_choice = delivery_guy_menu
        print `clear`
        delivery_guy_action(user_choice)
      end
    end
  end

  def manager_menu
    puts "-----------------"
    puts "------MENU-------"
    puts "-----------------"
    puts "What would you like to do?"
    puts "1. List meals"
    puts "2. Add a meal"
    puts "3. Add a customer"
    puts "4. List customers"
    puts "5. Add an order"
    puts "6. List undelivered orders"
    puts "9. Quit program"
    print ">"
    gets.chomp.to_i
  end

  def delivery_guy_menu
    puts "-----------------"
    puts "------MENU-------"
    puts "-----------------"
    puts "What would you like to do?"
    puts "1. List my undelivered orders."
    puts "2. Mark an order as delivered."
    puts "9. Quit program"
    print ">"
    gets.chomp.to_i
  end

  def manager_action(user_choice)
    case user_choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list
    when 9 then @running = false
    else      puts "Wrong choice, try again"
    end
  end

  def delivery_guy_action(user_choice)
    case user_choice
    when 1 then @orders_controller.list_undelivered_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 9 then @running = false
    else
      puts "Wrong choice, try again"
    end
  end







end
