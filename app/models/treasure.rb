class Treasure < ApplicationRecord
  belongs_to :event
  validates :name, uniqueness: true
  validates :gold_value, numericality: true
  validates :name, :gold_value, :type, presence: true
end
