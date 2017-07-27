class Character < ApplicationRecord
  belongs_to :user
  has_one :planner
  validates :xp, numericality: true
  validate :validate_leveling_up, :on => :update, if: :just_leveled_up?,
           unless: :skip_level_validation

  attr_accessor :skip_level_validation

  def add_event_xp(event)
    self.xp += event.xp
    until self.xp < 99
      level_up
    end
    save
  end

  def level_up
    self.level += 1
    self.xp -= 100
    self.spendable_points += 30
  end


  def validate_leveling_up
    binding.pry
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
    if total <= self.spendable_points
      self.spendable_points -= total
    else
      self.errors.add(:base, "Can't increase attributes by more than 30 per level added")
    end
  end

  def attribute_ceiling
    self.resistant + self.subtle + self.powerful + self.spendable_points
  end

  def just_leveled_up?
    spendable_points > 0
  end


end