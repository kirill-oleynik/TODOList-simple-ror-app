# frozen_string_literal: true

require_relative '../../lib/json_web_token.rb'

RSpec.describe JsonWebToken do
  let!(:payload_1) { attributes_for(:user).slice(:email, :password_digest) }
  let!(:payload_2) { attributes_for(:user).slice(:email, :password_digest) }
  let!(:expire) { 1.hour.from_now }
  describe '#encode' do
    context 'whith same payload and expiration provided' do
      let(:token_1) { JsonWebToken.encode(payload_1, expire) }
      let(:token_2) { JsonWebToken.encode(payload_1, expire) }
      it ' generates same token' do
        expect(token_1).to eq(token_2)
      end
    end
    context 'with differen payloads and same expiration provided' do
      let(:token_1) { JsonWebToken.encode(payload_1, expire) }
      let(:token_2) { JsonWebToken.encode(payload_2, expire) }
      it 'generate different tokens' do
        expect(token_1).not_to eq(token_2)
      end
    end
    context 'with same payload and default expiration' do
      it 'generate different tokens' do
        token1 = JsonWebToken.encode(payload_1)
        sleep(5) # required to set time interval between tokens genration
        token2 = JsonWebToken.encode(payload_1)
        expect(token1).not_to eq(token2)
      end
    end
  end
  describe '#decode' do
    it 'returns payload that ewas encoded' do
      token = JsonWebToken.encode({ email: 'user@example.com', password_digest: 'password' })
      decoded = JsonWebToken.decode(token).slice('email', 'password_digest')
      expect(decoded.transform_keys(&:to_sym))
        .to eq({ email: 'user@example.com', password_digest: 'password' })
    end
  end
end
