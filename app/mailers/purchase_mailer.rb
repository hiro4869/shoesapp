class PurchaseMailer < ApplicationMailer
  default from: "from@example.com"

  def purchase_email(email, purchase)
    @u_name = purchase.u_name
    mail to: email, subject: "記事を投稿しました"
  end
end
