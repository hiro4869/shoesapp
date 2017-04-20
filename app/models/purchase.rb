class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # validates :purchase_num, presence: true
  # validates :u_name, presence: true
  # validates :u_address, presence: true
  # validates :u_phone_num, presence: true
  # validates :u_email, presence: true

  validate :purchase_num_is_not_0

  #購入数が0ではいけない
  def purchase_num_is_not_0
    if self.purchase_num == 0
      errors.add(:purchase_num, '購入数は0ではいけない')
    end
  end

end