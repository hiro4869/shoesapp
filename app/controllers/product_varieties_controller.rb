class ProductVarietiesController < ApplicationController

  def show
    @Product = Product.find(params[:product_id])
    @ProductVariety = ProductVariety.find(params[:id])

    @cart = Cart.new
  end

  def new
    @Product = Product.find(params[:product_id])
    @ProductVariety = ProductVariety.new
  end

  def create
    @ProductVariety = ProductVariety.new(product_variety_params)
    @ProductVariety.product_id = params[:product_id]
    if @ProductVariety.save

      # 複数画像の保存
      if params[:product_variety][:image].present?
        params[:product_variety][:image].each do |image|
          @product_variety_image = ProductVarietyImage.new
          @product_variety_image.product_variety_id = @ProductVariety.id
          @product_variety_image.image = image
          @product_variety_image.save
        end
      end

      redirect_to edit_product_path(params[:product_id])
    else
      render 'product_varieties/new'
    end
  end

  def edit
    @Product = Product.find(params[:product_id])
    @ProductVariety = ProductVariety.find(params[:id])
  end

  def update
    @ProductVariety = ProductVariety.find(params[:id])

    # 画像を保存
    if params[:product_variety][:image].present?
      params[:product_variety][:image].each do |image|
        @product_variety_image = ProductVarietyImage.new
        @product_variety_image.product_variety_id = params[:id]
        @product_variety_image.image = image
        @product_variety_image.save
      end
    end

    if @ProductVariety.update(product_variety_params)
      redirect_to edit_product_product_variety_path(params[:product_id], params[:id])
    else
      render 'product_varieties/edit'
    end
  end

  def destroy
    @ProductVariety = ProductVariety.find(params[:id])
    @ProductVariety.destroy
    redirect_to edit_product_path(params[:product_id])
  end

  private

  def product_variety_params
    params.require(:product_variety).permit(:color, :size, :price, :stock, :image)
  end

end

