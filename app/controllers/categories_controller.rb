class CategoriesController < ApplicationController
  add_breadcrumb "home", :root_path


  def show
    @products = Product.where("category_id = #{params[:id]}")

    add_breadcrumb "カテゴリーページ"
  end

end
