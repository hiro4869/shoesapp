class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  has_many :purchases

  validate :role_0_or_1?

  def role_0_or_1?
    role = self.role
    if  role == 1 || role == 0
      return true
    else
      errors.add(:role, "roleは0または1を入力して下さい")
    end
  end



  # def unique_userbook

  #   if Userbook.where(user_id: self.user_id).where(book_id: self.book_id).exists?
  #    errors.add(:book_id, "ここはなんでもいい")
  #   end

  #   # Userbook.where(user_id: self.user_id).where(book_id: self.book_id).exists?
  #   # user_id.exists? && book_id.exists?
  #   # user_id.presence?

  #   # num = 7
  #   # if num == 8
  #   #   errors.add(:title, " ここにエラーを入力する") 
  #   # end
  # end



end
