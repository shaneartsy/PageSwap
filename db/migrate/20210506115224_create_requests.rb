class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.references :buyer_item, foreign_key: { to_table: 'catalog_items' }
      t.references :seller_item, foreign_key: { to_table: 'catalog_items' }

      t.timestamps
    end
  end
end
