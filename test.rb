require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"

pad_thai = Meal.new(name: "Pad thai", price: 10)

meal_repo = MealRepository.new("data/meals.csv")
# p pad_thai

p meal_repo.all
