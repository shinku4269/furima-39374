class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presense: true
  validates :email,               presense: true, uniqueness: true, inclusion: { in: ["@"]}
  validates :encrypted_password,  presense: true, length: { minimum: 6 },
                                  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :family_name,         presense: true, 
                                  format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name,          presense: true, 
                                  format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_furigana,presense: true,
                                  format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_furigana, presense: true,
                                  format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_day,           presense: true
   
  
end
