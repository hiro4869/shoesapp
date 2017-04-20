class PurchasesController < ApplicationController
  before_action :admin_user, only: [:index]
  before_action :sign_in?, only: [:new]

  def index
    @purchases  = Purchase.all.order("created_at DESC")
  end

  def new
    @purchase = Purchase.new
    @product = Product.find(params[:product_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    @purchase.product_id = params[:product_id]
    if @purchase.save

      #管理ユーザーにメールを送信
      adminuser = ENV['email']
      PurchaseMailer.purchase_email(adminuser, @purchase).deliver

      #購入者にメールを送る
      user_email = @purchase.u_email
      PurchaseMailer.purchase_email(user_email, @purchase).deliver

      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:u_name, :u_address, :u_phone_num, :u_email, :purchase_num)
  end

  def admin_user
    if current_user.role != 1
      redirect_to root_path
    end
  end

  def sign_in?
    if user_signed_in?
      return true
    else
      redirect_to new_user_registration_path
    end
  end

end
