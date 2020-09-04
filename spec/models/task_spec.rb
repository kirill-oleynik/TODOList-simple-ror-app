# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    before { FactoryBot.build(:task) }
    it { should validate_presence_of(:title) }
    it { validate_uniqueness_of(:title).case_insensitive }
  end
end
