class Genre < ApplicationRecord

  has_many :items, dependent: :destroy

  #バリデーション
  validates :name, presence: true
 # validates :name, uniqueness: true
end
