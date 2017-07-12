class UsersController < ApplicationController
  #自分の出品した商品のみ一覧を確認可能
  before_action :correct_user, only: [:show]
  before_action :admin_user, only: [:adminpage, :new, :edit]

  #ぱんくずリストを表示
  add_breadcrumb "home", :root_path


  def show
    @user = User.find(params[:id])
    @user_products = @user.products

    #購入履歴を抽出
    @purchases = Purchase.where("user_id = #{params[:id]}").order("created_at DESC")

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

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to "/user/#{current_user.id}"
    else
      render '/users/edit'
    end

  end

  def adminpage
    @products = Product.all
    #パンくずリスト
    add_breadcrumb "管理者ページ"
  end

  def privacy_policy
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :agreement, :address, :phone_number, :name)
  end

  def admin_user
    if user_signed_in?
      if current_user.role != 1
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

end
