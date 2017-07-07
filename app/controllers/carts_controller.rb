class CartsController < ApplicationController
  # カートの中身を表示するページ
  def index
    @cart = Cart.where(user_id: current_user.id).where(buy_after_flag: false)
    @cart_after = Cart.where(user_id: current_user.id).where(buy_after_flag: true)
  end

  # 商品を新しくカートに追加する
  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id

    if @cart.save
      redirect_to cart_added_confirm_user_carts_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  # 「商品をカートに追加しました」と表示されるページ
  def cart_added_confirm
  end

  # 商品を「あとで買う」に入れる
  def raise_flag
    @cart = Cart.find("#{params[:cart][:id]}")
    if @cart.update(buy_after_flag:true)
      redirect_to user_carts_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  # 商品をカートに戻す
  def down_flag
    @cart = Cart.find("#{params[:cart][:id]}")
    if @cart.update(buy_after_flag:false)
      redirect_to user_carts_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def confirmation
    @cart = Cart.where(user_id: current_user.id).where(buy_after_flag: false)
  end

  # カートから商品を削除
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to user_carts_path(current_user.id)
  end



private
  def cart_params
    params.require(:cart).permit(:product_variety_id, :quantity, :buy_after_flag, :id)
  end

end
