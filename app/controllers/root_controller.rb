class RootController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9).order("updated_at desc")

    # 検索用
    if params[:p_name].present? 
      @products = @products.get_by_p_name(params[:p_name]).order("updated_at desc")
    end
  end

  def company 
  end

end


