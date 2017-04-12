class UsersController < ApplicationController
  #自分の出品した商品のみ一覧を確認可能
  # before_action :correct_user, only: [:show]
  before_action :admin_user, only: [:show]

  #ぱんくずリストを表示
  add_breadcrumb "home", :root_path

  def show
    # @user = User.find(params[:id])
    # @user_products = @user.products
    @products = Product.all

    #パンくずリスト
    add_breadcrumb "管理者ページ"
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

  # def correct_user
  #   user = User.find(params[:id])
  #   if current_user.id != user.id
  #     redirect_to root_path
  #   end
  # end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def admin_user
    if current_user.role != 1
      redirect_to root_path
    end
  end

end
