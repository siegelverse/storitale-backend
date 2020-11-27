class Review < ApplicationRecord
    belongs_to :user
    belongs_to :story
    validates :body, presence: true, allow_blank: false
end
