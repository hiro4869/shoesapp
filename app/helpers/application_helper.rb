module ApplicationHelper
  def total(cart)
    total = 0
    cart.each do |item|
      total += item.sub_total
    end
    return total
  end
end
