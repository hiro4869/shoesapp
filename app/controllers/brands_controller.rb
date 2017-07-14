class BrandsController < ApplicationController
  def show
    @products = Product.where("brand_id = #{params[:id]}").order("updated_at desc")
    @brand = Brand.find(params[:id])
  end
end
