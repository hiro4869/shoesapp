class MethodOfPayment < ApplicationRecord
  has_many :orders
end
