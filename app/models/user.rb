class User < ApplicationRecord
    has_many :comments
    has_many :articles, through: :comments
end
