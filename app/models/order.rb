class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1,  production: 2, preparing: 3,  shipped: 4 }


end
