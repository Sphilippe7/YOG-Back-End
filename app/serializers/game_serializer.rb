class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :month, :rating, :platform
end
