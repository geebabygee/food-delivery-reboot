class Customer
  attr_accessor :id
  attr_reader :name, :address
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def display_in_list # This is used in the Base View to display the attributes which are specific to each model and cannot be generalised in a Base View.
    "#{@id}. - #{@name}, #{@address}."
  end
end
