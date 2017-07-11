class ProductImagesController < ApplicationController
  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
    redirect_to edit_product_path(params[:product_id])
  end
end
