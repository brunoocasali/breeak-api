require 'rails_helper'

RSpec.describe Status, type: :model do
  context 'database associations' do
    it { is_expected.to belong_to(:person) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:last_logged_at) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:last_logged_at).of_type(:date) }
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:person_id) }
  end
end
