require_relative 'manager'

if __FILE__ == $PROGRAM_NAME
  shawna = Employee.new("Shawna", 12000, "TA")
  david = Employee.new("David", 10000, "TA")
  darren = Manager.new("Darren", 78000, "TA Manager")
  ned = Manager.new("Ned", 1000000, "Founder")

  darren.add_minion(shawna)
  david.add_boss(darren)
  darren.add_boss(ned)

  puts darren.bonus(4)

  puts "Darren's minions"
  p darren.minions
  puts "---"

  puts "Ned's salary and bonus"
  p "#{ned.salary} Bonus: #{ned.bonus(5)}"


end



class Employee

  attr_accessor :name, :salary, :title, :boss

  def initialize(name, salary, title, boss = nil)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
  end

  def add_boss(new_boss)
    @boss = new_boss
    unless boss.minions.include?(self)
      boss.minions << self
    end
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end
