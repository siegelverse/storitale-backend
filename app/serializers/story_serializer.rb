class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :description, :favorites_count, :created_at
  has_many :reviews
  belongs_to :user
  has_many :favorites
end
