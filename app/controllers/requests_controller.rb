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
    @items = []
    CatalogItem.where(user: current_user).each do |item|
      @items << [item.book.title, item.id]
    end
  end

  def destroy
    request = Request.find(params[:id])
    request.delete
    redirect_to dashboard_path
  end

  def update
    request = Request.find(params[:id])
    request.update(request_params)
    item = CatalogItem.find(params[:request][:seller_item])
    request.seller_item = item
    request.save
    redirect_to dashboard_path
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end
end
