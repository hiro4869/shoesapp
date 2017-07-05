class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def create
    # ショップカートの中身を抽出
    @cart = Cart.where(user_id: current_user.id).where(buy_after_flag: false)

    # オーダーを新規作成
    @Order = Order.new
    @Order.user_id = current_user.id
    @Order.save

    #ユーザーの最新のオーダーを取得
    @OrderNow = Order.where(user_id: current_user.id).last

    #注文された商品を１レコードずつ保存
    @cart.each do |item|
      @purchase = Purchase.new
      @purchase.order_id = @OrderNow.id
      @purchase.product_id = item.product_id
      @purchase.quantity = item.quantity
      @purchase.price = item.product.price
      @purchase.p_name = item.product.p_name
      @purchase.save
    end
    
    # ショップカートの中身を全て削除
    @cart.destroy_all

    redirect_to confirmation_orders_path

  end

  def confirmation
    @order = Order.where(user_id: current_user.id).last
  end



end
