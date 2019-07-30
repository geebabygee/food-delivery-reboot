require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "router"

# WHERE ALL THE MAGIC HAPPENS, CHECK ME OUT!


# Repository Instances
meal_repository = MealRepository.new("data/meals.csv")
customer_repository = CustomerRepository.new("data/customers.csv")

# Controller Instances
meals_controller = MealsController.new(meal_repository)
customer_controller = CustomersController.new(customer_repository)

# Router Instance
router = Router.new(meals_controller, customer_controller)

router.run
