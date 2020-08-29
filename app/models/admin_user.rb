# frozen_string_literal: true

# Admin user entity
class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, uniqueness: true,
                    presence: true
end
