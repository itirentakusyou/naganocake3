class Item < ApplicationRecord

  has_one_attached :itm_imag_url

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  #バリデーション
  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true


end
