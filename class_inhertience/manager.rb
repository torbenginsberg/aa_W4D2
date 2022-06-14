require_relative "./employee.rb"

class Manager < Employee

    def initialize(name, title, salary, boss=nil)
        super
        @subordinates = []
    end

    attr_accessor :subordinates

    def add_sub(employee_inst)
        if employee_inst.boss == self
            subordinates << employee_inst
        elsif employee_inst.boss.nil?
            subordinates << employee_inst
            employee_inst.boss = self
        else
            employee_inst.boss.subordinates.delete(employee_inst)
            subordinates << employee_inst
            employee_inst.boss = self
        end
    end


end

bob = Manager.new("bob", "ceo", 1902801)
fred = Employee.new("fred", "janitor", 1, bob)
bob.add_sub(fred)


p bob
p fred