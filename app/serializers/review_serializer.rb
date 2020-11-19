class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating 
  belongs_to :user
  belongs_to :story, serializer: UserStoriesSerializer
end
