# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before { FactoryBot.build(:user) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { validate_uniqueness_of(:email).case_insensitive }
    it { should have_secure_password }
  end
end
