class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :characters
  has_many :planners, :through => :characters
end
