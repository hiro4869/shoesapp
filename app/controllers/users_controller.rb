class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @user_products = @user.products
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to root_path
    end
  end

end
