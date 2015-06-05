require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'database associations' do
    it { is_expected.to belong_to(:person) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:person_id).of_type(:integer) }

    it { is_expected.to have_db_column(:latitude).of_type(:decimal)
                            .with_options(precision: 10, scale: 6) }
    it { is_expected.to have_db_column(:longitude).of_type(:decimal)
                            .with_options(precision: 10, scale: 6) }
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:person_id) }
  end
end
