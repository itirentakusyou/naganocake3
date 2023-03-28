class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  validates :item_id, uniqueness: { scope: :customer_id }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  def subtotal
    item.with_tax_price * quantity  #税込価格＊数量
  end
  
  
end
