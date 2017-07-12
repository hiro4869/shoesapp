class OrdersController < ApplicationController
  before_action :admin_user, only: [:admin_index]

  def index
    if user_signed_in?
      @orders = Order.where(user_id: current_user.id).order("created_at DESC")
    else
      redirect_to new_user_session_path
    end
  end

  def admin_index
    @orders = Order.all.order("created_at DESC").page(params[:page]).per(20)
  end

  def create
    # ショップカートの中身を抽出
    @cart = Cart.where(user_id: current_user.id).where(buy_after_flag: false)

    # オーダーを新規作成
    @Order = Order.new(order_params)
    @Order.user_id = current_user.id
    @Order.save

    total = 0

    #注文された商品を１レコードずつ保存
    @cart.each do |item|
      @purchase = Purchase.new
      @purchase.order_id = @Order.id
      @purchase.product_variety_id = item.product_variety_id
      @purchase.quantity = item.quantity
      @purchase.price = item.product_variety.product.price
      @purchase.p_name = item.product_variety.product.p_name
      @purchase.save
      total += item.product_variety.product.price * item.quantity
    end

    # 送料を判定してOrderに書き込み
    if total >= 50000
      postage = 0
    else
      postage = 1000
    end
    @Order.postage = postage
    
    # userの情報をOrderに保存
    @user = User.find(current_user.id)
    @Order.name = @user.name
    @Order.address = @user.address
    @Order.email = @user.email
    @Order.phone_number = @user.phone_number
    @Order.save

    #管理ユーザーにメールを送信
    adminuser = "fukunagakaihatu48@gmail.com"
    OrderMailer.order_email(adminuser, @Order).deliver_later

    #購入者にメールを送る
    user_email = @Order.email
    OrderMailer.order_email(user_email, @Order).deliver_later

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

  # 管理ユーザー以外はトップページへリダイレクト
  def admin_user
    if user_signed_in?
      if current_user.role != 1
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

end
