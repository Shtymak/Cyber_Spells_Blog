class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one_attached :avatar
  has_many :comments

  has_many :conversations, :foreign_key => :sender_id

  def logo
      if avatar.attached?
          avatar
      else
          "/nfd.jpg"
      end
  end
end
