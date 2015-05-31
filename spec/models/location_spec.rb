require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'database associations' do
    # it { is_expected.to belong_to(:person) }
  end

  context 'model validations' do
    # it { is_expected.to validate_presence_of(:person) }

    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
  end

  context 'model attributes' do
    # it { is_expected.to have_db_column(:person_id).of_type(:integer)
    #                         .with_options(null: false) }

    it { is_expected.to have_db_column(:latitude).of_type(:decimal)
                            .with_options(precision: 10, scale: 6) }
    it { is_expected.to have_db_column(:longitude).of_type(:decimal)
                            .with_options(precision: 10, scale: 6) }
  end

  context 'database indexes' do
    # it { is_expected.to have_db_index(:person_id) }
  end

  #
  # context 'scope methods' do
  #   describe '.will_happen' do
  #     it { expect(described_class).to respond_to(:will_happen) }
  #
  #     it 'needs to return some objects' do
  #       event = create(:event, start_at: DateTime.now + 1)
  #       create(:event, start_at: DateTime.now - 2)
  #
  #       expect(described_class.will_happen).to match_array([event])
  #     end
  #   end
  #
  #   describe '#tweets' do
  #     subject { create(:event, services: %w(ServiceKind::TWITTER)) }
  #
  #     it { expect(subject).to respond_to(:tweets) }
  #
  #     it 'only tweets objects' do
  #       tweet = create(:item, service: ServiceKind::TWITTER)
  #       # TODO: When add the new searcher methods uncomment this lines to
  #       # improve testability
  #       # post = create(:item, service: ServiceKind::FACEBOOK)
  #
  #       subject.items << tweet # << post
  #
  #       expect(subject.tweets).to match_array([tweet])
  #     end
  #   end
  # end
  #
  # context 'hooks methods' do
  #   describe '#drop_hash_tag' do
  #     it { expect(described_class.new).to respond_to(:drop_hash_tag) }
  #
  #     it 'needs to remove hash_tag from tag' do
  #       event = create(:event, hash_tag: '#trololo')
  #
  #       expect(event.hash_tag).to eq('trololo')
  #     end
  #   end
  # end
  #
  # context 'presenter methods' do
  #   describe '#tag' do
  #     it { expect(described_class.new).to respond_to(:tag) }
  #
  #     it 'needs to show a string with complete hash_tag' do
  #       event = create(:event, hash_tag: '#trololo')
  #
  #       expect(event.tag).to eq('#trololo')
  #     end
  #   end
  # end
end
