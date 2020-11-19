class GenreSerializer < ActiveModel::Serializer
  attributes :id, :label
  has_many :stories, serializer: UserStoriesSerializer
end
