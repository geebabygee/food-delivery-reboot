require_relative "../../app/views/orders_view"

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @order_repo = order_repo
    @view = OrdersView.new
  end

  # Manager actions

  def add
    #1. ask user for meal id (view)
    meal_id = @view.ask_for("meal id").to_i
    customer_id = @view.ask_for("customer id").to_i
    employee_id = @view.ask_for("employee id").to_i
    #2. find the actual meal instance in the meal repo (m-repo)
    meal = @meal_repo.find(meal_id)
    customer = @customer_repo.find(customer_id)
    employee = @employee_repo.find(employee_id)
    order = Order.new(meal: meal, customer: customer, employee: employee)
    #3. repeat for customer and employee
    #4. make an order instance (model)
    @order_repo.add(order)
    #5. send to repo to add (m-repo)
  end

  def list
    # 1. get the undelivered orders from the repo (repo)
    undelivered_orders = @order_repo.undelivered_orders
    #2. send to view to display (view)
    @view.display(undelivered_orders)
  end

  # Delivery guy actions

  def list_undelivered_orders(employee) # employee comes from the router
    # 1. get the undelivered orders that are mine from the repo (repo)
    undelivered_orders = @order_repo.list_undelivered_orders(employee)
    # 2. send to view to display (view)
    @view.display(undelivered_orders)
  end

  def mark_as_delivered(employee) # employee comes from the router
    # 1. show the undelivered orders list for the employee
    list_undelivered_orders(employee)
    # 2. delivery guy picks number to say he's delivered it (view)
    order_id = @view.ask_for("order id").to_i
    @order_repo.mark_as_delivered(order_id)

  end

end
