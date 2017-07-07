class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :product_variety
end
