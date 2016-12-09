class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :month, :rating, :platform, :editable
  has_one :user

  def editable
    scope == object.user
  end
end
