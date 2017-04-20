class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :u_name, presence: true
  validates :u_address, presence: true

  #注文数は1以上100以下
  validates :purchase_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100}

  #電話番号に不正な値が入らないようにバリデーション(ハイフン無し半角数字のみ)
  #ハイフン有りの場合はこちらを使用「/\A\d+-\d+-\d+\z/」 
  VALID_PHONENUM_REGEX = /\A\d+\z/
  validates :u_phone_num, presence: true, format: { with: VALID_PHONENUM_REGEX }

  #メールに不正な値が入らないようにバリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :u_email, presence: true, format: { with: VALID_EMAIL_REGEX }

end