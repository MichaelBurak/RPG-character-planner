class Character < ApplicationRecord
  belongs_to :user
  has_one :planner
  validates :xp, numericality: true

  def total_xp
    total = 0
    self.planner.events.each do |event|
      total += event.xp
    end
    self.xp += total
    case
      when self.xp > 99
        level_up
    end
    self.save
  end

  def level_up
    self.level += 1
    self.xp = self.xp - 100
    self.subtle += rand(1..10)
    self.powerful += rand(1..10)
    self.resistant += rand(1..10)
  end
end
