require "csv"
require_relative "../../app/models/order"

class OrderRepository
  def initialize(csv_file,meal_repo,customer_repo,employee_repo)
    @csv_file = csv_file
    @orders = [] # array of order instances
    @next_id = 1
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    load_csv if File.exist?(@csv_file)
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_to_csv
  end

  def undelivered_orders # select returns an array of undelivered instances
    @orders.select {|order| order.delivered? == false}
  end

  def list_undelivered_orders(employee) # I call the undelivered_orders method from above which returns an array of undeliverd order instances
    undelivered_orders.select { |order| order.employee.id == employee.id }
    # I check the id of the employee of the order I am iterating through against the employee instance which I have as a parameter.
    # I check the ids as they are unique and will retrieve me the right guy.
  end

  def mark_as_delivered(id)
  # 3. find instance in repo with that id (repo)
    order = @orders.find {|order| order.id == id}
  # 4. deliver it (model)
    order.deliver!
  # 5. save to csv
    save_to_csv
  end

  private

  # CSV ----> Order Instances
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]  = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repo.find(row[:meal_id].to_i) # meal instance
      row[:customer] = @customer_repo.find(row[:customer_id].to_i) # customer instance
      row[:employee] = @employee_repo.find(row[:employee_id].to_i) # employee instance
      @orders << Order.new(row)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  # Order instances ----> CSV

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id","meal_id","customer_id", "employee_id", "delivered"]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered]
        # what I store in my csv are ids, so I get ids from all my models
      end
    end
  end






end
