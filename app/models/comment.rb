class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user
    has_many :replies
end
