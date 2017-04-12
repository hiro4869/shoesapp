class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  #ぱんくずリストを表示
  add_breadcrumb "home", :root_path

  def show
    @user = User.find(params[:id])
    @user_products = @user.products

    #パンくずリスト
    add_breadcrumb "#{@user.email}さんのマイページ"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render '/users/new'
    end
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
