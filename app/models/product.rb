class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :product_images
  has_many :product_varieties, dependent: :destroy
  has_many :carts
  has_many :purchases
  # mount_uploader :image, ImageUploader

  validates :p_name, presence: true, uniqueness: true
  validates :price, presence: true
  # validates :description, presence: true


  # 商品名による絞り込み
  scope :get_by_p_name, ->(p_name) {
    where("p_name like ?", "%#{p_name}%")
  }

  # セール価格を算出
  def sale_price
    self.price * (100 - self.discount_rate)/100
  end

end
