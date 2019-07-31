class Order

  attr_reader :meal, :employee, :customer, :delivered
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @delivered = attributes[:delivered] || false # boolean
    @meal = attributes[:meal] # instance of meal
    @customer = attributes[:customer] # instance of customer
    @employee = attributes[:employee] # instance of employee
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  # This is used because we have the base view so we need to customise the display of each model
  def display_in_list
    "#{@id}. #{@meal.name} for #{@customer.name} delivered by #{@employee.username}"
  end




end


