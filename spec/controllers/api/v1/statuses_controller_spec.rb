require 'rails_helper'

RSpec.describe Api::V1::StatusesController, type: :controller do
  let(:valid_attributes) { attributes_for(:status) }
  let(:invalid_attributes) { attributes_for(:invalid_status) }

  describe 'GET #index' do
    it 'returns a collection of statuses' do
      status = create :status, valid_attributes

      get :index, format: :json

      expect(assigns(:statuses)).to include(status)
    end
  end

  describe 'GET #show' do
    it 'returns a status passed by param' do
      status = create :status, valid_attributes

      get :show, id: status.to_param, format: :json
      expect(assigns(:status)).to eq(status)

      status = status.to_json
      expect(response.body['id']).to eq(status['id'])
      expect(response.body['last_logged_at']).to eq(status['last_logged_at'])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Status' do
        expect {
          post :create, status: valid_attributes, format: :json
        }.to change(Status, :count).by(1)
      end

      it 'assigns a newly created status as @status' do
        post :create, status: valid_attributes, format: :json

        expect(assigns(:status)).to be_a(Status)
        expect(assigns(:status)).to be_persisted
      end

      it 'redirects to the created status' do
        post :create, status: valid_attributes, format: :json

        expect(response).to be_created
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved status as @status' do
        post :create, status: invalid_attributes, format: :json

        expect(assigns(:status)).to be_a_new(Status)
      end

      it 'return status for unprocessed entity' do
        post :create, status: invalid_attributes, format: :json

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :status }

      it 'updates the requested status' do
        status = create :status, valid_attributes

        put :update, id: status.to_param, status: new_attributes, format: :json
        status.reload

        expect(status.last_logged_at).to eq(new_attributes[:last_logged_at])
        expect(response).to be_success
      end

      it 'assigns the requested status as @status' do
        status = create :status, valid_attributes

        put :update, id: status.to_param, status: valid_attributes, format: :json

        expect(assigns(:status)).to eq(status)
      end
    end

    context 'with invalid params' do
      it 'assigns the status as @status' do
        status = create :status, valid_attributes

        put :update, id: status.to_param, status: invalid_attributes, format: :json

        expect(assigns(:status)).to eq(status)
      end

      it 'return status for unprocessed entity' do
        status = create :status, valid_attributes

        put :update, id: status.to_param, status: invalid_attributes, format: :json

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested status' do
      status = create :status, valid_attributes

      expect {
        delete :destroy, id: status.to_param, format: :json
      }.to change(Status, :count).by(-1)
    end

    it 'redirects to the status list' do
      status = create :status, valid_attributes

      delete :destroy, id: status.to_param, format: :json

      expect(response).to be_success
    end
  end
end
