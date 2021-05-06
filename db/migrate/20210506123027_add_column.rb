class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :parent_id, :integer, null: true, index: true
    add_foreign_key :comments, :comments, column: :parent_id
  end
end
