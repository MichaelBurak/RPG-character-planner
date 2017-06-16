class Event < ApplicationRecord
  belongs_to :planner
  has_many :treasures
  validates :xp, numericality: true

  def self.highest_xp_events
    all.order(xp: :desc).limit(3)
  end

  def treasures_attributes=(treasures_attributes)
    treasures_attributes.delete_if { |_i, h| h.any? { |_k, v| v.empty? } }
    treasures_attributes.values.each do |treasure_attributes|
      self.treasures.build(treasure_attributes)
    end
  end
end