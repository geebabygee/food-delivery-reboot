require_relative "../../app/models/employee"
class EmployeeRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def find_by(username)
    @employees.find {|employee| employee.username == username}
  end

  def find(id)
    @employees.find {|employee| employee.id == id}
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]  = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.last.id + 1 unless @employees.empty?
  end




end
