require 'rails_helper'

RSpec.describe Api::V1::StatusesController, type: :controller do
  let(:status) { create(:status) }

  describe 'GET #index' do
    it 'returns a collection of statuses' do
      get :index

      # response = JSON.parse(response.body)

      expect(assigns(:statuses)).to include(status)
      expect(response).to eq([status.to_json])
    end
  end

  describe 'GET #show' do
    it 'returns a collection of statuses' do
      get :show, id: status.to_param

      expect(assigns(:status)).to eq(status)

      response_status = JSON.parse(response.body)
      expect(response_status['id']).to eq(status.id)
      expect(response_status['last_logged_at']).to eq(status.last_logged_at)
      expect(response_status['person_id']).to eq(status.person_id)
    end
  end
end
