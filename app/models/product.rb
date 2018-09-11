class Product < ApplicationRecord
  belongs_to :user
  belongs_to :designer
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

end
