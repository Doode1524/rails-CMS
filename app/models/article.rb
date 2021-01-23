class Article < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    validates :title, uniqueness: true
    accepts_nested_attributes_for :comments
    paginates_per 20

def self.by_source(source)
    where(source: source)
end 


def self.all_sources
    Article.pluck(:source).uniq.sort
end

end
