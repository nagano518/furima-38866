class Item < ApplicationRecord

  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :status_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :area_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :shipping_date_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_charge
    belongs_to :area
    belongs_to :shipping_date

end
