class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :content
    validates :image
    validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :shipping_date_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_charge
    belongs_to :area
    belongs_to :shipping_date

end
