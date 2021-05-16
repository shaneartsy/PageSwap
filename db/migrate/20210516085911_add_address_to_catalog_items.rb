class AddAddressToCatalogItems < ActiveRecord::Migration[6.0]
  def change
    add_column :catalog_items, :address, :string
  end
end
