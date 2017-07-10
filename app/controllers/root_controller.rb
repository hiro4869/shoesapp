class RootController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(50)
  end
end
