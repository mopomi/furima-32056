class OrdersController < ApplicationController



  def index
    @items = Item.find(params[:item_id])
  end
end
