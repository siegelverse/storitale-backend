class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :stories
    has_many :favorites, dependent: :destroy

    acts_as_follower
    acts_as_followable
    
    validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }

    def favorite(story)
        favorites.find_or_create_by(story: story)
    end
    
    def unfavorite(story)
        favorites.where(story: story).destroy_all
    
        story.reload
    end
    
    def favorited?(story)
        favorites.find_by(story_id: story.id).present?
    end
end
