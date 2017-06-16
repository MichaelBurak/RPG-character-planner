class Treasure < ApplicationRecord
  belongs_to :event
  validates :name, uniqueness: true
  validates :gold_value, numericality: true
end
