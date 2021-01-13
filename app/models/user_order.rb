class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :postal_code, :city, :building_number, :prefecture_id, :phone_number, :token

  with_options presence: true do
    validates :address
    validates :postal_code,  format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
    validates :user_id
    validates :item_id
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(address: address, postal_code: postal_code, city: city, prefecture_id: prefecture_id, building_number: building_number, phone_number: phone_number, order_id: order.id)
  end
end