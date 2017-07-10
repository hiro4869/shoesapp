class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def create
    # ショップカートの中身を抽出
    @cart = Cart.where(user_id: current_user.id).where(buy_after_flag: false)

    # オーダーを新規作成
    @Order = Order.new(order_params)
    @Order.user_id = current_user.id
    @Order.save

    #ユーザーの最新のオーダーを取得
    @OrderNow = Order.where(user_id: current_user.id).last

    total = 0

    #注文された商品を１レコードずつ保存
    @cart.each do |item|
      @purchase = Purchase.new
      @purchase.order_id = @OrderNow.id
      @purchase.product_variety_id = item.product_variety_id
      @purchase.quantity = item.quantity
      @purchase.price = item.product_variety.price
      @purchase.p_name = item.product_variety.product.p_name
      @purchase.save
      total += item.product_variety.price * item.quantity
    end

    # 送料の判定
    if total >= 50000
      postage = 0
    else
      postage = 1000
    end
    
    @OrderNow.postage = postage
    @OrderNow.save

    # ショップカートの中身を全て削除
    @cart.destroy_all

    redirect_to confirmation_orders_path

  end

  def confirmation
    @order = Order.where(user_id: current_user.id).last
  end


  private
  def order_params
    params.require(:order).permit(:method_of_payment_id)
  end

end
