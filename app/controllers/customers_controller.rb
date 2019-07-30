require_relative "../../app/views/customers_view"
require_relative "../../app/models/customer"

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = CustomersView.new
  end

  def list
    customers = @customer_repo.all
    @view.display(customers)
  end

  def add
    name = @view.ask_user_for("name")
    address = @view.ask_user_for("address")
    customer = Customer.new(name: name, address: address)
    @customer_repo.add(customer)
  end
end
