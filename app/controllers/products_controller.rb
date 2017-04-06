class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @products = Product.page(params[:page]).per(50)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:price, :p_name, :description, :user_id, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def correct_user
    product = Product.find(params[:id])
    if current_user.id != product.user.id
      redirect_to root_path
    end
  end

end
