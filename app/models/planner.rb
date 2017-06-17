class Planner < ApplicationRecord
  belongs_to :character
  belongs_to :user
  has_many :events
  has_many :treasures, :through => :events
end