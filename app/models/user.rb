require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  # TODO_magic_constants
  validates :username, presence: true, length: { in: 2..20 }
  validates :bio, length: { maximum: 500 }, allow_blank: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true,
                    format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\Z/,
                              message: 'Only emails allowed' }

  validates :role, presence: true

  attr_accessor :password

  def authenticate(plaintext_password)
    if BCrypt::Password.new(encrypted_password) == plaintext_password
      self
    else
      false
    end
  end
end
