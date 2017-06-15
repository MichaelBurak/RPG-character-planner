class Event < ApplicationRecord
  belongs_to :planner
  validates :xp, numericality: true
end
