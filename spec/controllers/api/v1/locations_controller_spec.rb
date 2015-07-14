require 'rails_helper'

RSpec.describe Api::V1::LocationsController, type: :controller do
  let(:valid_attributes) { attributes_for(:location) }
  let(:invalid_attributes) { attributes_for(:invalid_location) }

  describe 'GET #index' do
    it 'returns a collection of locations' do
      location = create :location, valid_attributes

      get :index, format: :json

      expect(assigns(:locations)).to include(location)
    end
  end

  describe 'GET #show' do
    it 'returns a location passed by param' do
      location = create :location, valid_attributes

      get :show, id: location.to_param, format: :json
      expect(assigns(:location)).to eq(location)

      location = location.to_json
      expect(response.body['latitude']).to eq(location['latitude'])
      expect(response.body['longitude']).to eq(location['longitude'])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Location' do
        expect {
          post :create, location: valid_attributes, format: :json
        }.to change(Location, :count).by(1)
      end

      it 'assigns a newly created location as @location' do
        post :create, location: valid_attributes, format: :json

        expect(assigns(:location)).to be_a(Location)
        expect(assigns(:location)).to be_persisted
      end

      it 'redirects to the created location' do
        post :create, location: valid_attributes, format: :json

        expect(response).to be_created
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved location as @location' do
        post :create, location: invalid_attributes, format: :json

        expect(assigns(:location)).to be_a_new(Location)
      end

      it 'return location for unprocessed entity' do
        post :create, location: invalid_attributes, format: :json

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :location }

      it 'updates the requested location' do
        location = create :location, valid_attributes

        put :update, id: location.to_param, location: new_attributes, format: :json
        location.reload

        expect(location.latitude).to eq(new_attributes[:latitude].to_d)
        expect(location.longitude).to eq(new_attributes[:longitude].to_d)
        expect(response).to be_success
      end

      it 'assigns the requested location as @location' do
        location = create :location, valid_attributes

        put :update, id: location.to_param, location: valid_attributes, format: :json

        expect(assigns(:location)).to eq(location)
      end
    end

    context 'with invalid params' do
      it 'assigns the location as @location' do
        location = create :location, valid_attributes

        put :update, id: location.to_param, location: invalid_attributes, format: :json

        expect(assigns(:location)).to eq(location)
      end

      it 'return location for unprocessed entity' do
        location = create :location, valid_attributes

        put :update, id: location.to_param, location: invalid_attributes, format: :json

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested location' do
      location = create :location, valid_attributes

      expect {
        delete :destroy, id: location.to_param, format: :json
      }.to change(Location, :count).by(-1)
    end

    it 'redirects to the location list' do
      location = create :location, valid_attributes

      delete :destroy, id: location.to_param, format: :json

      expect(response).to be_success
    end
  end
end
