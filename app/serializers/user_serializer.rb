class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :bio, :password
  has_many :stories, serializer: UserStoriesSerializer
  has_many :reviews
  has_many :follows
  has_many :favorites
end
