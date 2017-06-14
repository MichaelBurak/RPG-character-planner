class Character < ApplicationRecord
  belongs_to :user
  has_one :planner
end
