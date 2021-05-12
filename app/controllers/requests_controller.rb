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

  def accept
    @request = Request.find(params[:id])
    @request.status = "accepted"
    @request.save
    redirect_to pending_swaps_path
  end

  def decline
    @request = Request.find(params[:id])
    @request.status = "declined"
    @request.save
    redirect_to pending_swaps_path
  end

  def dashboard
    @requests = Request.all
  end

  def pending_swaps
    @requests = Request.where(status: 'pending')
    @items = []
    CatalogItem.where(user: current_user).each do |item|
      @items << [item.book.title, item.id]
    end
  end

  def accepted_swaps
    @requests = Request.where(status: 'accepted')
    @items = []
    CatalogItem.where(user: current_user).each do |item|
      @items << [item.book.title, item.id]
    end
  end

  def declined_swaps
    @requests = Request.where(status: 'declined')
    @items = []
    CatalogItem.where(user: current_user).each do |item|
      @items << [item.book.title, item.id]
    end
  end

  def past_swaps
    @requests = []
    Request.all.each do |request|
      if request.buyer_item.user == current_user
        @requests << ["recieved", request.buyer_item]
      elsif request.seller_item.user == current_user
        @requests << ["recieved", request.seller_item]
      end
    end
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



