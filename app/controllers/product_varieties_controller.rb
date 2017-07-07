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
    if @ProductVariety.update(product_variety_params)
      redirect_to edit_product_path(params[:product_id])
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
    params.require(:product_variety).permit(:color, :size, :price)
  end

end

