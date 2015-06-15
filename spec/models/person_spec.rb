require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'database associations' do
    it { is_expected.to have_one(:location) }
    it { is_expected.to have_one(:status) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:bio).of_type(:string) }
    it { is_expected.to have_db_column(:fb_access_token).of_type(:string) }
    it { is_expected.to have_db_column(:birthday_at).of_type(:date) }

    it { is_expected.to have_db_column(:tags).of_type(:text).with_options(default: {}) }
  end

  context 'validations specific cases' do
    it 'needs to raise an phone and email error' do
      expect {
        create(:person, email: nil, phone: nil)
      }.to raise_error
    end

    it 'needs to allow save with only the email' do
      expect {
        create(:person, email: 'brunoocasali@gmail.com', phone: nil)
      }.to change(Person, :count).by(1)
    end

    it 'needs to allow save with only the phone' do
      expect {
        create(:person, email: nil, phone: '46 99163882')
      }.to change(Person, :count).by(1)
    end
  end
end
