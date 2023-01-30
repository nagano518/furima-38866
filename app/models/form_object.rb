class FormObject
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :municipality_id, :address, :building_name, :telephone_number, :purchase 

  validates :item, presence: true
  validates :user, presence: true
  validates :postal_code, presence: true, format: { with:/\A\d{3}[-]\d{4}\z/ }
  validates :area_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
  validates :building_name
  validates :telephone, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :purchase, presence: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    address = Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, telephone: telephone, purchase_id: purchase.id)
  end
end