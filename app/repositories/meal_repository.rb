require "csv"
require_relative "../../app/models/meal"

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file) # only happens once on program opening
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_to_csv
  end

  def find(id)
    @meals.find {|meal| meal.id == id}
  end

  private

  # CSV rows of strings ----> Meal Instances
  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  # Meal Instances ----> CSV rows of strings
  def save_to_csv
    CSV.open(@csv_file, 'w') do |row|
      row << ["id", "name", "price"] # Header row
      @meals.each do |meal|
        row << [meal.id, meal.name, meal.price]
      end
    end
  end


end
