class CategoriesController < ApplicationController
  add_breadcrumb "home", :root_path


  def show
    @products = Product.where("category_id = #{params[:id]}").order("updated_at desc")

    #ページング
    # @categories = @products.page(params[:page])
    @products = @products.page(params[:page]).per(10)

    #パンくずリスト
    add_breadcrumb "カテゴリーページ"
  end

end
