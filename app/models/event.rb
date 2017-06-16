class Event < ApplicationRecord
  belongs_to :planner
  has_many :treasures
  validates :xp, numericality: true
  validates :name, uniqueness: true
  validates :xp, :name, presence: true

  scope :highest_exp_events, (->() {all.order(xp: :desc).limit(3)})

  def treasures_attributes=(treasures_attributes)
    treasures_attributes.delete_if { |_i, h| h.any? { |_k, v| v.empty? } }
    treasures_attributes.values.each do |treasure_attributes|
      treasures.build(treasure_attributes)
    end
  end
end