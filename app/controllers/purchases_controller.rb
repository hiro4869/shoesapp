class PurchasesController < ApplicationController
  before_action :admin_user, only: [:index]

  def index
    @purchases  = Purchase.all
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

end
