require_relative "../../app/views/meals_view"
require_relative "../../app/models/meal"

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @meals_view = MealsView.new

  end

  # User actions
  def list
    #1.get meals from meal repo (repo)
    meals = @meal_repo.all
    #2. send to view to display (view)
    @meals_view.display(meals)
  end

  def add
    #1. Ask user for name and price of meal(view)
    name = @meals_view.ask_for("name")
    price = @meals_view.ask_for("price").to_i
    #2. Instantiate a meal with the given info
    meal = Meal.new(name: name, price: price)
    #3. Send meal to repo to add
    @meal_repo.add(meal)
  end


end
