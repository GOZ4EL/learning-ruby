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
end
