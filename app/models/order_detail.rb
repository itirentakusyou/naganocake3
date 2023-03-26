class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: {
    impossible: 0,
    waiting: 1,
    production: 2,
    completion: 3
  }
end
