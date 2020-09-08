# frozen_string_literal: true

require 'simple_command'
require './app/commands/authorize_api_request.rb'
require './lib/json_web_token.rb'

RSpec.describe AuthorizeApiRequest do
  describe 'when user exists & provided token is valid' do
    let!(:user) { create(:user) }
    let(:auth_token) { "Basic #{JsonWebToken.encode({ user_id: user.id })}" }
    let(:request_headers) { { 'Authorization' => auth_token } }
    let(:command) { described_class.new(request_headers) }
    it 'returns current user' do
      expect(command.call.result).to eq(user)
    end
  end
  describe 'when user does not exist' do
    let(:auth_token) { "Basic #{JsonWebToken.encode({ user_id: rand(100) })}" }
    let(:request_headers) { { 'Authorization' => auth_token } }
    let(:command) { described_class.new(request_headers) }
    it 'returns nil and sets expected errors' do
      command.call
      expect(command.result).to equal(nil)
      expect(command.errors.transform_keys(&:to_sym)[:token]).to include('Invalid token')
    end
  end
end
