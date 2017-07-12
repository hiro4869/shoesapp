class BrandsController < ApplicationController
  def show
    @products = Product.where("brand_id = #{params[:id]}")
    @brand = Brand.find(params[:id])
  end
end
