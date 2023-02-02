class FormObject
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :municipality, :address, :building_name, :telephone_number, :purchase_id, :token 

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token, 
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end