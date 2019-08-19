require_relative "employee"

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss)
    super 
    @employees = []
  end

  def bonus(multiplier)
    employees_salary_sum = 0
    @employees.flatten.each do |employee|
      employees_salary_sum += employee.salary
    end
    bonus = employees_salary_sum * multiplier
  end

  def add_employee(employee)
    @employees << employee
    if employee.is_a?(Manager)
      @employees << employee.employees
    end
  end

end