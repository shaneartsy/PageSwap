class AddCategoryAndRatingToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :category, :string
    add_column :books, :rating, :integer
  end
end
