class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :purchase_num, presence: true
  validates :u_name, presence: true
  validates :u_address, presence: true
  validates :u_phone_num, presence: true
  validates :u_email, presence: true

end