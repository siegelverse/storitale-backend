class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :stories
    has_many :likes
    validates :username, uniqueness: { case_sensitive: true }
end
