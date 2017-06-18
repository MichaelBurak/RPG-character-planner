class Character < ApplicationRecord
  belongs_to :user
  has_one :planner
  validates :xp, numericality: true
  validate :validate_leveling_up, :on => :update, :if => :just_leveled_up?

  def add_event_xp
    self.xp += planner.events.last.xp
    until self.xp < 99
      level_up
      self.just_leveled_up = true
    end
    self.save
  end

  def level_up
    self.level += 1
    self.xp -= 100
  end


  def validate_leveling_up
    total = 0
    subtle = self.changes[:subtle]
    powerful = self.changes[:powerful]
    resistant = self.changes[:resistant]
    if self.subtle_changed?
      subtle_change = subtle[1] - subtle[0]
      total += subtle_change
    end
    if self.powerful_changed?
    powerful_change = powerful[1] - powerful[0]
      total += powerful_change
    end
    if self.resistant_changed?
    resistant_change = resistant[1] - resistant[0]
      total += resistant_change
    end
    if total > 30
      self.errors.add(:level, "Can't increase attributes by more than 30")
      self.update_attribute(:just_leveled_up, nil)
    end
  end

  end