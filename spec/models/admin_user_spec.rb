# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'validations' do
    before { FactoryBot.build(:admin_user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { validate_uniqueness_of(:email).case_insensitive }
  end
end
