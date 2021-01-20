class Article < ApplicationRecord
    validates_uniqueness_of :title, :description
    paginates_per 20

end
