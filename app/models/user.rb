VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze # TODO: common constant
require 'bcrypt'

class User < ApplicationRecord
  # has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  # TODO: magic_constants
  validates :username, length: { in: 2..20 }
  validates :bio, length: { maximum: 500 }, allow_blank: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true,
                    format: { with: VALID_EMAIL_REGEX, message: 'Only emails allowed' }

  validates :role, presence: true

  def self.authenticate(password)
    BCrypt::Password.new(encrypted_password) == password
  end

  def self.make_encrypted_password(password)
    BCrypt::Password.create(password)
  end
end
