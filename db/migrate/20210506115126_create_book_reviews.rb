class CreateBookReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :book_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
