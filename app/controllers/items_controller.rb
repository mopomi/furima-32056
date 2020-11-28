class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :introduction, :category_id, :item_condition_id, :shipping_payer_id,
                                 :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end
end


# 「ログイン状態で、URLを直接入力して売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること」
# ★↑before_actionにて商品購入機能実装時に実装する★
