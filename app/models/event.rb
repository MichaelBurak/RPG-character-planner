class Event < ApplicationRecord
  belongs_to :planner
  validates :xp, numericality: true

  def self.highest_xp_events
    all.order(xp: :desc).limit(3)
  end
end
