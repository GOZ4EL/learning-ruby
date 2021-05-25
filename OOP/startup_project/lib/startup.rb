require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end 

    def valid_title?(title)
       salaries.each_key { |valid_title| return true if title === valid_title }
       
       false
    end

    def >(other)
        if @funding > other.funding
            true
        else
            false
        end
    end

    def hire(employee_name, title)
        raise "Invalid title" if !valid_title?(title)

        @employees << Employee.new(employee_name, title)
    end

    def size 
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]

        raise "Insufficent funds to pay this salary" if @funding < salary
        
        employee.pay(salary)
        @funding -= salary
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total = 0
        @employees.each { |employee| total += @salaries[employee.title] }

        total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each { |key, val| @salaries[key] = val if !@salaries.key?(key) }

        @employees.concat(startup.employees)
        
        startup.close
    end
end
