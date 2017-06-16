class Character < ApplicationRecord
  belongs_to :user
  has_one :planner
  validates :xp, :subtle, :powerful, :resistant, :level, :numericality => { :greater_than_or_equal_to => 0 }
  validates :name, uniqueness: true
  validates :name, :xp, :subtle, :powerful, :resistant, :level, presence: true

  def add_event_xp
    self.xp += planner.events.last.xp
    until self.xp < 99
      level_up
    end
    self.save
  end

  def level_up
    self.level += 1
    self.xp -= 100
    self.subtle += rand(1..10)
    self.powerful += rand(1..10)
    self.resistant += rand(1..10)
  end
end