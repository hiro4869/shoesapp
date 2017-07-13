class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :product_variety

  validates :quantity, presence: true

  def sub_total
    if self.product_variety.product.sale 
      self.product_variety.product.sale_price * self.quantity
    else 
      self.product_variety.product.price * self.quantity
    end 
  end

end
