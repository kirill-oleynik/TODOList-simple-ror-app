# frozen_string_literal: true

# Task entity
class Task < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
