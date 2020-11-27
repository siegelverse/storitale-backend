class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :favorites_count
  has_many :reviews
  belongs_to :user
end
