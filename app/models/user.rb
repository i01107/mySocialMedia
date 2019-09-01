class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fellowships
  has_many :followings, through: :fellowships

  has_many :inverse_followings, class_name: "Fellowship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followings, source: :user
end
