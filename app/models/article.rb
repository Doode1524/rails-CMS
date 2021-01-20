class Article < ApplicationRecord
    validates_uniqueness_of :title, :description

end
