# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  setup { host! 'api.example.com' }
  describe 'POST /tasks' do
    context 'whith valid params' do
      let(:params) { { task: { title: 'do smth' } } }
      before { post api_tasks_path params: params }
      it 'returns expected response' do
        expect(response).to have_http_status(201)
        expect(response).to match_json_schema('task')
      end
    end
    context 'with invalid params' do
      let(:params) { { task: { title: nil } } }
      before { post api_tasks_path params: params }
      it {}
      it 'returns 422 status code' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
