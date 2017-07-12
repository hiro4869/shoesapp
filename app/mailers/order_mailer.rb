class OrderMailer < ApplicationMailer
  default from: "from@example.com"

  def order_email(email, order)
    @order = order
    mail to: email, subject: "ご注文ありがとうございます"
  end
end
