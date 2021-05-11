class RequestsController < ApplicationController

  def create
    @request = Request.new
    @buyer_item = CatalogItem.find(params[:catalog_item_id])
    @request.buyer_item = @buyer_item
    @request.user = current_user
    @request.status = "pending"
    @request.seller_item = CatalogItem.find(params[:request][:seller_item])
    @request.save
    flash[:notice] = "Swap requested"
    redirect_to user_catalog_items_path(@buyer_item.user)
  end

 def new
    @request = Request.new
    @buyer_item = CatalogItem.find(params[:catalog_item_id])
    @my_items = CatalogItem.where(user: current_user)
  end

  def dashboard
    @requests = Request.all
  end
end
