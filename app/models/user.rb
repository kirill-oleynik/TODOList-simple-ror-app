# frozen_string_literal: true

# TODOList User entity
class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, presence: true
end
