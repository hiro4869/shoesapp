class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # ログインユーザーのみ閲覧可能
  # before_action :authenticate_user!

  #自分で出品した商品のみ編集可能
  # before_action :correct_user, only: [:edit, :update]

  #パンくずリスト
  add_breadcrumb "home", :root_path

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
    #パンくずリスト
    add_breadcrumb @product.p_name

    @cart = Cart.new
  end

  def edit
    #パンくずリスト
    add_breadcrumb "#{@product.p_name}の編集ページ"
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
    params.require(:product).permit(:price, :p_name, :description, :user_id, :image, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  # def correct_user
  #   product = Product.find(params[:id])
  #   if current_user.id != product.user.id
  #     redirect_to root_path
  #   end
  # end

end
