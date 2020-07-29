class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password
  has_many :drinks
end
