class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pics
  has_many :comments, dependent: :destroy

  def ordinary?
    role == 'ordinary'
  end

  def admin?
    role == 'admin'
  end
end
