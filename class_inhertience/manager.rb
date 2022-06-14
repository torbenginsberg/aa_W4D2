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

    def bonus(multiplier)
        bfs * multiplier
    end

    def bfs
        queue = [self]
        salary_sum = 0
        until queue.empty?
            node = queue.shift
            if node.instance_of?(Manager)
                node.subordinates.each do |subordinate|
                    salary_sum += subordinate.salary
                    queue << subordinate
                end
            end
        end
        salary_sum
    end


end

bob = Manager.new("bob", "ceo", 1000)
fred = Manager.new("fred", "janitor", 100, bob)
bob.add_sub(fred)
jim = Manager.new("jim", "analyst", 10, fred)
fred.add_sub(jim)

mark = Manager.new("mark", "vp", 50, fred)
jim.add_sub(mark)
mark1 = Employee.new("mark", "vp", 50, mark)
mark2 = Employee.new("mark", "vp", 50, mark)
mark3 = Employee.new("mark", "vp", 50, mark)
mark.add_sub(mark1)
mark.add_sub(mark2)
mark.add_sub(mark3)

p bob.bonus(2)
