class User < ApplicationRecord
    has_many :comments
    has_many :articles, through: :comments
    has_many :replies
    has_many :subscriptions
    has_one_attached :avatar
    has_secure_password


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    before_save { self.email = email.downcase }
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

    validates :username, presence: true, uniqueness: true
    validates :email, uniqueness: true

    

end


