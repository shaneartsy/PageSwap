class CreateUserReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :user_reviews do |t|
      t.text :content
      t.integer :rating
      t.references :author, foreign_key: { to_table: 'users' }
      t.references :receiver, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
