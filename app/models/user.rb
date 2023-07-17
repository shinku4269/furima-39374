class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :email,               presence: true, uniqueness: true, inclusion: { in: ["@"]}
  validates :encrypted_password,  presence: true, length: { minimum: 6 },
                                  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :family_name,         presence: true, 
                                  format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name,          presence: true, 
                                  format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_furigana,presence: true,
                                  format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_furigana, presence: true,
                                  format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_day,           presence: true
end
