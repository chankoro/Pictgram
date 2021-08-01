class User < ApplicationRecord
  validates :name, presence: true, length:{maximum:15 }
  
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  
  has_secure_password
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,32}\z/
  validates :password, presence: true, length:{ minimum: 8, maximum:32 },
                       format: { with: VALID_PASSWORD_REGEX, message:"は半角8~32文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
end
