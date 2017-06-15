class Character < ApplicationRecord
  belongs_to :user
  has_one :planner

  def total_xp
    total = 0
    self.planner.events.each do |event|
      total += event.xp
    end
    self.xp += total
    case
      when self.xp > 99
      self.level += 1
        self.xp = self.xp - 100
    end
    self.save
  end

end
