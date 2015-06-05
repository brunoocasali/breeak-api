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
end
