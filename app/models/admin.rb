class Admin < ApplicationRecord
  has_secure_password
  validates :login, uniqueness: true
end
