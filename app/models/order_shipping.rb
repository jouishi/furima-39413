class OrderShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end