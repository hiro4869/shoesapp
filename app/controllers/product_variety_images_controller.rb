class ProductVarietyImagesController < ApplicationController
  def destroy
    @product_variety_images = ProductVarietyImage.find(params[:id])
    @product_variety_images.destroy
    redirect_to  edit_product_product_variety_path(params[:product_id], params[:product_variety_id])
  end
end
