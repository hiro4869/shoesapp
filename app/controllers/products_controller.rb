class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # ログインユーザーのみ閲覧可能
  # before_action :authenticate_user!

  #自分で出品した商品のみ編集可能
  # before_action :correct_user, only: [:edit, :update]

  #パンくずリスト
  add_breadcrumb "top", :root_path

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
      params[:product][:image].each do |image|
        @product_images = ProductImage.new
        @product_images.product_id = @product.id
        @product_images.image = image
        @product_images.save
      end
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

    @product_varieties = ProductVariety.where(product_id: "#{params[:id]}")
  end

  def update
    # 画像を保存
    params[:product][:image].each do |image|
      @product_images = ProductImage.new
      @product_images.product_id = params[:id]
      @product_images.image = image
      @product_images.save
    end

    if @product.update(product_params)
      redirect_to edit_product_path(params[:id])
    else
      redirect_to edit_product_path(params[:id])
    end

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
