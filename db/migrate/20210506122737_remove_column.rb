class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :nodes_id
    remove_column :comments, :parent_id
  end
end
