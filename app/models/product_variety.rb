class ProductVariety < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_many :product_variety_images, dependent: :destroy
  has_many :purchases
end
