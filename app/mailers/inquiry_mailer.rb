class InquiryMailer < ApplicationMailer
  default from: "from@example.com"

  def inquiry_email(email, inquiry)
    @inquiry = inquiry
    mail to: email, subject: "お問い合わせを送信しました"
  end
end
