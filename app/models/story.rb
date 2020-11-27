class Story < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :user
    has_many :favorites, dependent: :destroy

    acts_as_taggable

    validates :title, presence: true, allow_blank: false
    validates :body, presence: true, allow_blank: false

    scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }
end
