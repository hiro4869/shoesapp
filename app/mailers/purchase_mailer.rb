class PurchaseMailer < ApplicationMailer
  default from: "from@example.com"

  def purchase_email(email, purchase)
    @purchase = purchase
    mail to: email, subject: "ご購入ありがとうございます"
  end
end
