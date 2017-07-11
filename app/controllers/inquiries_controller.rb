class InquiriesController < ApplicationController

  def index
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save

      #管理ユーザーにメールを送信
      adminuser = "fukunagakaihatu48@gmail.com"
      InquiryMailer.inquiry_email(adminuser, @inquiry).deliver_later

      #購入者にメールを送る
      user_email = @inquiry.email
      InquiryMailer.inquiry_email(user_email, @inquiry).deliver_later

      redirect_to inquiries_path
    else
      render 'new'
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:title, :name, :email, :body)
  end
end
