class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :check_edit_permission, only: :index

  def index
    @ordershipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @ordershipping = OrderShipping.new(order_params)
    if @ordershipping.valid?
      pay_item
      @ordershipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def check_edit_permission
    item = Item.find(params[:item_id])
    redirect_to root_path if item.user == current_user
  end

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end
end
