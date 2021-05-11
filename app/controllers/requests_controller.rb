class RequestsController < ApplicationController

  def create
    @request = Request.new
    @catalog_item = CatalogItem.find(params[:catalog_item_id])
    @request.buyer_item = @catalog_item
    @request.user = current_user
    @request.save
    redirect_to user_catalog_items_path(@catalog_item.user)
  end

  def dashboard
    @requests = Request.all
  end

  def destroy
    request = Request.find(params[:id])
    request.delete
    redirect_to dashboard_path
  end

end
