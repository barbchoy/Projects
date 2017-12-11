require_relative 'employee'

class Manager < Employee

  attr_accessor :minions

  def initialize(name, salary, title, boss = nil, minions = [])
    super(name, salary, title, boss)
    @minions = minions
  end

  def add_minion(new_minion)
    @minions << new_minion
    unless new_minion.boss.nil? || new_minion.boss.name != self.name
      new_minion.add_boss(self)
    end
  end

  def bonus(multiplier)
    sum = 0
    minions.each do |minion|
      sum += minion.salary
    end
    sum * multiplier
  end

end
