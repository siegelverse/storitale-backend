class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :stories, serializer: UserStoriesSerializer
  has_many :reviews
end
