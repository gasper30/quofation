class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :designer
  has_many :fitting_photos
  has_many :discussion
  
  def admin?
    self.role == "admin"
  end

end
