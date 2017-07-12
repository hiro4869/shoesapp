class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :product_variety

  validates :quantity, presence: true
end
