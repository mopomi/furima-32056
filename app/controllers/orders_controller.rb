class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @address_purchase = AddressPurchase.new
  end

  def create
     @address_purchase = AddressPurchase.new(address_params)
     if @address_purchase.valid?
        pay_item
        @address_purchase.save
        redirect_to root_path
     else
       render action: :index
     end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.require(:address_purchase).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number )
    .merge(user_id: current_user.id, item_id:(params[:item_id]), token: params[:token])
  end

  def move_to_index
    redirect_to root_path unless @item.user != current_user
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end