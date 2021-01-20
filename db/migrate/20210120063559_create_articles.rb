class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :author
      t.text :title
      t.text :description
      t.text :url
      t.string :source
      t.text :image
      t.string :category
      t.string :language
      t.string :country
      t.datetime :published_at

      t.timestamps
    end
  end
end
