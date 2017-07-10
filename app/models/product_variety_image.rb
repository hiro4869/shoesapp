class ProductVarietyImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product_variety
end
