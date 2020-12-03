class UserStoriesSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :description, :created_at ,:user
end
