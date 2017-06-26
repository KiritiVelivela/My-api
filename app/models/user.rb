class User < ApplicationRecord
  has_secure_password

  belongs_to :role

  validates_presence_of :name, :email, :password_digest




end
