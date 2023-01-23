class Item < ApplicationRecord

  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :area_id, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]{3,7}+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :genre_id, numericality: { other_than: 1 ,message: "can't be blank"} 

  belongs_to :user
  has_one_attaches :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_charge
    belongs_to :area
    belongs_to :shipping_date

end
