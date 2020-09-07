# frozen_string_literal: true

require 'simple_command'
require './app/commands/authenticate_user.rb'

RSpec.describe AuthenticateUser do
  describe 'called with incalid credentials' do
    let(:credentials) { attributes_for(:user).slice(:email, :password) }
    describe '#call' do
      let(:command) { AuthenticateUser.new(credentials).call }
      it 'returns nil as result & specifies errors' do
        expect(command.result).to equal(nil)
        expect(command.errors.any?).to equal(true)
        expect(command.errors.length).to equal(1)
        expect(command.errors[:user_authentication]).to include('invalid credentials')
      end
    end
  end
  describe 'called with valid credentials' do
    let!(:user) { create(:user) }

    describe '#result' do
      let(:command) { AuthenticateUser.new(email: user.email, password: user.password).call }
      it 'returns generated auth token without any errors' do
        expect(command.result.class).to equal(String)
        expect(command.result.length > 1).to equal(true)
        expect(command.errors).to be_empty
      end
    end
  end
end
