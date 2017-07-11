class OrderMailer < ApplicationMailer
  default from: "from@example.com"

  def order_email(email, order, items)
    @order = order
    @items　= items
    mail to: email, subject: "ご注文ありがとうございます"
  end
end
