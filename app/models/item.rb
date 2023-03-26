class Item < ApplicationRecord

  has_one_attached :itm_image_url

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  #バリデーション
  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true
  
  def with_tax_price
   (price * 1.1).floor
  end

end
