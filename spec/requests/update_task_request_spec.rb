# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  setup { host! 'api.example.com' }
  describe 'PUT /tasks' do
    let!(:task) { create(:task, title: 'title-1') }
    describe 'with valid params' do
      let(:params) { { task: { title: 'title-2' } } }
      before { put "#{api_tasks_path}/#{task.id}", params: params }
      it 'updates entity & returns expected response' do
        expect(response).to have_http_status(200)
        expect(response).to match_json_schema('task')
        expect(
          JSON.parse(response.body)['title']
        ).to eq('title-2')
      end
    end
    describe 'with invalid params' do
      let(:params) { { task: { title: nil } } }
      before { put "#{api_tasks_path}/#{task.id}", params: params }
      it 'returns 422 status code' do
        expect(response).to have_http_status(422)
      end
      it 'includes errors description' do
        expect(
          JSON.parse(response.body).keys
        ).to include('title')
      end
      describe 'when entity does not exist' do
        let(:params) { { task: { title: nil } } }
        before { put "#{api_tasks_path}/0", params: params }
        it 'returns 404 status code' do
          expect(response).to have_http_status(404)
        end
      end
    end
  end
end
