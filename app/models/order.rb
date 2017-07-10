class Order < ApplicationRecord
  has_many :purchases, dependent: :destroy
  belongs_to :method_of_payment
end
