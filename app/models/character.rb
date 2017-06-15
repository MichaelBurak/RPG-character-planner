class Character < ApplicationRecord
  belongs_to :user
  has_one :planner

  def total_xp
    total = 0
    self.planner.events.each do |event|
      total += event.xp
    end
    self.xp += total
    self.save
  end

end
