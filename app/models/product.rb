class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :purchases
  mount_uploader :image, ImageUploader

  validates :p_name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
end
