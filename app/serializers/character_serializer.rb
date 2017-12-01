class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :subtle, :powerful, :resistant, :level, :xp, :spendable_points, :updated_attributes
  belongs_to :user
  has_one :planner
end
