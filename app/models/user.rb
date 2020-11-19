class User < ApplicationRecord
    has_many :reviews
    has_many :stories
    has_many :likes
    has_secure_password
end
