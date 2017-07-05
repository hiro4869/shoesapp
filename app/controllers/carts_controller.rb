class CartsController < ApplicationController
  def index
    @cart = Cart.where(user_id: current_user.id).where(buy_after_flag: false)
    @cart_after = Cart.where(user_id: current_user.id).where(buy_after_flag: true)
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

  def raise_flag
    # @cart = Cart.find_by(user_id: current_user.id)
    @cart = Cart.find_by(id: "#{params[:cart][:id]}")
    # @cart = Cart.find_by(user_id: 11)

    if @cart.update(buy_after_flag:true)
      redirect_to user_carts_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def down_flag
  end


  def cart_added_confirm
  end

private
  def cart_params
    params.require(:cart).permit(:product_id, :quantity, :buy_after_flag, :id)
  end

end
