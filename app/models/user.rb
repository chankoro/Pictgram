class User < ApplicationRecord
  validates :name, presence: true, length:{maximum:15 }
  
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  
  has_secure_password
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,32}\z/
  validates :password,format: { with: VALID_PASSWORD_REGEX, message:"は半角8~32文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end