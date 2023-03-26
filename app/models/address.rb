class Address < ApplicationRecord

  belongs_to :customer
  validates :post_code, length: {is: 7}, numericality: { only_integer: true }, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def shipping_address_for_view
  	self.post_code + "　" + self.address + "　" + self.name
  end

end
