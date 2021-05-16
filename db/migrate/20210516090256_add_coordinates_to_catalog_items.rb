class AddCoordinatesToCatalogItems < ActiveRecord::Migration[6.0]
  def change
    add_column :catalog_items, :latitude, :float
    add_column :catalog_items, :longitude, :float
  end
end
