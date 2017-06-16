class Character < ApplicationRecord
  belongs_to :user
  has_one :planner
  validates :xp, numericality: true

  def total_xp
    self.xp += planner.events.last.xp
    until self.xp < 99
      binding.pry
      level_up
    end
    self.update
  end

  def level_up
    self.level += 1
    self.xp - 100
    self.subtle += rand(1..10)
    self.powerful += rand(1..10)
    self.resistant += rand(1..10)
  end
end