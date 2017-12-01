class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :xp
  belongs_to :planner
end
