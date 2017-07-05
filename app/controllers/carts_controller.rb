class CartsController < ApplicationController
  def index
    @cart = Cart.where(user_id: current_user.id)
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id

    if @cart.save
      redirect_to cart_added_confirm_user_carts_path(current_user.id)
    else
      redirect_to root_path
    end

  end

  def cart_added_confirm

  end

private
  def cart_params
    params.require(:cart).permit(:product_id, :quantity)
  end

end
