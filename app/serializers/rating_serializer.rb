class RatingSerializer < ActiveModel::Serializer
  attributes :score, :user_id, :drink_id, :id
  belongs_to :drink
  belongs_to :user
end
