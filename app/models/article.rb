class Article < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    validates_uniqueness_of :title, :description
    paginates_per 20

end
