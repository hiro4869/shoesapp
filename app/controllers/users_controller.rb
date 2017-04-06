class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  add_breadcrumb "home", :root_path

  def show
    @user = User.find(params[:id])
    @user_products = @user.products

    #パンくずリスト
    add_breadcrumb "#{@user.email}さんのマイページ"
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to root_path
    end
  end

end
