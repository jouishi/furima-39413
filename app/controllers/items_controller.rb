class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_edit_permission, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
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
  end
  

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if @item.user == current_user
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_edit_permission
    return unless @item.order.present? && @item.user == current_user

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id,
                                 :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :item_image).merge(user_id: current_user.id)
  end
end
