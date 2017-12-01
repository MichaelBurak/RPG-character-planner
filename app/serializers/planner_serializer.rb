class PlannerSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :character
  belongs_to :user
  has_many :events
end
