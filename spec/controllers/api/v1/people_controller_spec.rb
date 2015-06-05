require 'rails_helper'

RSpec.describe Api::V1::PeopleController, type: :controller do
  let(:valid_attributes) { attributes_for(:person) }
  let(:invalid_attributes) { attributes_for(:invalid_person) }

  describe 'GET #index' do
    it 'returns a collection of people' do
      person = create :person, valid_attributes

      get :index, format: :json

      expect(assigns(:people)).to include(person)
    end
  end

  describe 'GET #show' do
    it 'returns a person passed by param' do
      person = create :person, valid_attributes

      get :show, id: person.to_param, format: :json
      expect(assigns(:person)).to eq(person)

      person = PersonSerializer.new(person).to_json
      expect(response.body['id']).to eq(person['id'])
      expect(response.body['status']['last_logged_at']).to eq(person['status']['last_logged_at'])
      expect(response.body['location']['latitude']).to eq(person['location']['latitude'])
      expect(response.body['location']['longitude']).to eq(person['location']['longitude'])
      expect(response.body['email']).to eq(person['email'])
      expect(response.body['bio']).to eq(person['bio'])
      expect(response.body['name']).to eq(person['name'])
      expect(response.body['birthday_at']).to eq(person['birthday_at'])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Person' do
        expect {
          post :create, person: valid_attributes, format: :json
        }.to change(Person, :count).by(1)
      end

      it 'assigns a newly created person as @person' do
        post :create, person: valid_attributes, format: :json

        expect(assigns(:person)).to be_a(Person)
        expect(assigns(:person)).to be_persisted
      end

      it 'redirects to the created person' do
        post :create, person: valid_attributes, format: :json

        expect(response).to be_created
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved person as @person' do
        post :create, person: invalid_attributes, format: :json

        expect(assigns(:person)).to be_a_new(Person)
      end

      it 'return person for unprocessed entity' do
        post :create, person: invalid_attributes, format: :json

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :person, tags: %w(girls teams) }

      it 'updates the requested person' do
        person = create :person, valid_attributes

        put :update, id: person.to_param, person: new_attributes, format: :json
        person.reload

        expect(person.email).to eq(new_attributes[:email])
        expect(person.bio).to eq(new_attributes[:bio])
        expect(person.name).to eq(new_attributes[:name])
        expect(person.tags).to eq(%w(girls teams))
        expect(response).to be_success
      end

      it 'assigns the requested person as @person' do
        person = create :person, valid_attributes

        put :update, id: person.to_param, person: valid_attributes, format: :json

        expect(assigns(:person)).to eq(person)
      end
    end

    context 'with invalid params' do
      it 'assigns the person as @person' do
        person = create :person, valid_attributes

        put :update, id: person.to_param, person: invalid_attributes, format: :json

        expect(assigns(:person)).to eq(person)
      end

      it 'return person for unprocessed entity' do
        person = create :person, valid_attributes

        put :update, id: person.to_param, person: invalid_attributes, format: :json

        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested person' do
      person = create :person, valid_attributes

      expect {
        delete :destroy, id: person.to_param, format: :json
      }.to change(Person, :count).by(-1)
    end

    it 'redirects to the person list' do
      person = create :person, valid_attributes

      delete :destroy, id: person.to_param, format: :json

      expect(response).to be_success
    end
  end
end
