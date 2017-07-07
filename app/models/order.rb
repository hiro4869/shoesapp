class Order < ApplicationRecord
  has_many :purchases, dependent: :destroy
end
