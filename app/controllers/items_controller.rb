class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :editA, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'items/edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id,
                                 :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :item_image).merge(user_id: current_user.id)
  end

  def editA
    @item = Item.find(params[:id])

    return if @item.user == current_user

    redirect_to root_path
  end
end
