class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy
  attachment :profile_image
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: {in:1..20}
  validates :email, presence: true
  validates :password, presence: true, length: {in:6..20}, on: :create
  validates :telephone, presence: true

end
