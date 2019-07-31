require_relative "app/models/meal"
require_relative "app/models/employee"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/repositories/order_repository"


# Repository instances
meal_repo = MealRepository.new("data/meals.csv")
customer_repo = CustomerRepository.new("data/customers.csv")
employee_repo = EmployeeRepository.new("data/employees.csv")
order_repo = OrderRepository.new("data/orders.csv", meal_repo,customer_repo,employee_repo)

