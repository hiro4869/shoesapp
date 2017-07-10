class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :product_images
  has_many :product_varieties
  has_many :carts
  has_many :purchases
  # mount_uploader :image, ImageUploader

  validates :p_name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
end
