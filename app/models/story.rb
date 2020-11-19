class Story < ApplicationRecord
    has_many :reviews
    has_many :likes 
    belongs_to :user
    belongs_to :genre
end
