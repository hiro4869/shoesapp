class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # validates :purchase_num, presence: true
  # validates :u_name, presence: true
  # validates :u_address, presence: true

  #電話番号に不正な値が入らないようにバリデーション(ハイフン無し半角数字のみ)
  #ハイフン有りの場合はこちらを使用「/\A\d+-\d+-\d+\z/」 
  VALID_PHONENUM_REGEX = /\A\d+\z/
  # validates :u_phone_num, presence: true, format: { with: VALID_PHONENUM_REGEX }


  #メールに不正な値が入らないようにバリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :u_email, presence: true, format: { with: VALID_EMAIL_REGEX }

  #購入数のカスタムバリデーション
  # validate :purchase_num_is_not_0

  #購入数が0ではいけない
  def purchase_num_is_not_0
      errors.add(:purchase_num, '購入数は0ではいけない') if self.purchase_num == 0
  end

end