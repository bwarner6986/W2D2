require_relative "employee"

class Manager < Employee

  def initialize(name, title, salary, boss)
    super 
    @employees = []
  end

  def bonus(multiplier)
    employees_salary_sum = 0
    @employees.each do |employee|
      employees_salary_sum += employee.salary
    end
    bonus = employees_salary_sum * multiplier
  end

end