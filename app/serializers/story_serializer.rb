class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :location
  has_many :reviews
  has_many :likes
  belongs_to :user
  belongs_to :genre
end
