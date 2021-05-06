class CreateCatalogItems < ActiveRecord::Migration[6.0]
  def change
    create_table :catalog_items do |t|
      t.string :quality
      t.text :user_summary
      t.boolean :available
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
