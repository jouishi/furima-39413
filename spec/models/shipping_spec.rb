require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @order_shipping = FactoryBot.build(:order_shipping)
  end

  describe 'Validations' do
    context '登録できるとき' do
      it '郵便番号と都道府県と市区町村と番地と電話番号とtokenが存在すれば登録できる' do
        expect(@order_shipping).to be_valid
      end
    end

    context '商品登録できないとき' do
      it '郵便番号が空では登録できない' do
        order_shipping = OrderShipping.new(postal_code: nil)
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:postal_code]).to include("can't be blank")
      end

      it '郵便番号は、3桁ハイフン4桁以外では登録できない' do
        order_shipping = OrderShipping.new(postal_code: '1234567')
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:postal_code]).to include('is invalid')
      end

      it '郵便番号は、全角では登録できない' do
        order_shipping = OrderShipping.new(postal_code: '７５４−０００２')
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:postal_code]).to include('is invalid')
      end

      it '都道府県が空では登録できない' do
        order_shipping = OrderShipping.new(prefecture_id: 1)
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:prefecture_id]).to include("can't be blank")
      end

      it '市区町村が空では登録できない' do
        order_shipping = OrderShipping.new(city: nil)
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:city]).to include("can't be blank")
      end

      it '番地が空では登録できない' do
        order_shipping = OrderShipping.new(addresses: nil)
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:addresses]).to include("can't be blank")
      end

      it '電話番号が空では登録できない' do
        order_shipping = OrderShipping.new(phone_number: nil)
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:phone_number]).to include("can't be blank")
      end

      it '電話番号は9桁以下は登録できない' do
        order_shipping = OrderShipping.new(phone_number: '12345')
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:phone_number]).to include('is invalid')
      end

      it '電話番号は12桁以上は登録できない' do
        order_shipping = OrderShipping.new(phone_number: '123456789000')
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:phone_number]).to include('is invalid')
      end

      it '電話番号は全角では登録できない' do
        order_shipping = OrderShipping.new(phone_number: '１２３４５６７８９００')
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:phone_number]).to include('is invalid')
      end

      it 'tokenが空では登録できない' do
        order_shipping = OrderShipping.new(phone_number: nil)
        expect(order_shipping).to be_invalid
        expect(order_shipping.errors[:token]).to include("can't be blank")
      end
    end
  end
end
