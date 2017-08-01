class User < ApplicationRecord

  has_secure_password
  has_many :contacts
  has_many :companies
end
