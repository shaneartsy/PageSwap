class RemoveUserSummaryFromCatalogItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :catalog_items, :user_summary, :string
  end
end
