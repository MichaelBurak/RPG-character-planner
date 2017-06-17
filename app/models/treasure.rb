class Treasure < ApplicationRecord
  belongs_to :event
  belongs_to :planner
  validates :name, uniqueness: true
  validates :gold_value, numericality: true
  validates :name, :gold_value, :kind, presence: true
end
