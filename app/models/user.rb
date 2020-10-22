class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(name: "ゲスト", email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  VALID_PASSWORD_REGEX =/([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/

  validates :name,                  presence: true
  validates :email,                 presence: true
  validates :password,              presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数字で入力してください"}
  # validates :password_confirmation, presence: true

  has_many :documents
  has_many :folders

end
