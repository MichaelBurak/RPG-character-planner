class Character < ApplicationRecord
  belongs_to :user
  has_one :planner
  validates :xp, numericality: true
  validates :validate_leveling_up, presence: true, if: @validate_level

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
    #self.subtle += rand(1..10)
    #self.powerful += rand(1..10)
    #self.resistant += rand(1..10)
  end

  #def validate_level?
   # validate_level == 'true' || validate_level == true
  #end

  def validate_leveling_up
    subtle = self.changes[:subtle]
    #raise.params.inspect
    powerful = self.changes[:powerful]
    resistant = self.changes[:resistant]

    subtle_change = subtle[1] - subtle[0]
    powerful_change = powerful[1] - powerful[0]
    resistant_change = resistant[1] - resistant[0]

    if subtle_change + powerful_change + resistant_change > 30
      self.errors.add("Can't increase by more than 30")
    end
end
end