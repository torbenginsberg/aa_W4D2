

class Employee

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        # add_boss if !boss.nil?
    end

    attr_reader :name
    attr_accessor :boss, :salary

    def bonus(multiplier)
        salary * multiplier
    end

    # def add_boss
    #     boss.add_sub(self)
    # end

end

