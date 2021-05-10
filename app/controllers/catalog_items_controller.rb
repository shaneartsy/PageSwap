class CatalogItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @user = User.find(params[:user_id])
    @items = @user.catalog_items
  end
end

