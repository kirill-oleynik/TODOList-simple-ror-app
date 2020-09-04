# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  setup { host! 'api.example.com' }
  describe 'DESTROY /tasks' do
    describe 'when entity does not exist' do
      before { delete("#{api_tasks_path}/1") }
      it 'returns 404 status code' do
        expect(response).to have_http_status(404)
      end
    end
    describe 'when entity exists' do
      let!(:task) { create(:task, id: 1) }
      before { delete("#{api_tasks_path}/#{task.id}") }
      it 'deletes entity and returns 204 status code' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
