class Review < ApplicationRecord
    belongs_to :user
    belongs_to :story
    validates :content, presence: true, allow_blank: false
end
