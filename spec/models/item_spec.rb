require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '商品登録できるとき' do
      it 'item_nameとitem_info、item_category_idとitem_sales_status_id、item_shipping_fee_status_idとitem_prefecture_id、item_scheduled_delivery_idとitem_price、item_imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it 'item_imageが空では登録できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item image can't be blank"
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end

      it 'item_category_idが---では登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end

      it 'item_sales_status_idが---では登録できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item sales status can't be blank"
      end

      it 'item_shipping_fee_status_idが---では登録できない' do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item shipping fee status can't be blank"
      end

      it 'item_prefecture_idが---では登録できない' do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item prefecture can't be blank"
      end

      it 'item_scheduled_delivery_idが---では登録できない' do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item scheduled delivery can't be blank"
      end

      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end

      it 'item_priceに全角文字が含まれる場合、登録できない' do
        @item.item_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is not a number'
      end
    end
  end
end
