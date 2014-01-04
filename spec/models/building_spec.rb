require 'spec_helper'

describe Building do
  context 'validations' do
    it { should have_valid(:street_address).when('123 congress st', '54 ocean lane') }
    it { should_not have_valid(:street_address).when(nil, '') }

    it { should have_valid(:city).when('Boston', 'New York City') }
    it { should_not have_valid(:city).when(nil, '') }

    it { should have_valid(:state).when('MA', 'NY') }
    it { should_not have_valid(:state).when(nil, '') }

    it { should have_valid(:postal_code).when('04102', '12345') }
    it { should_not have_valid(:postal_code).when(nil, '') }
    it { should ensure_length_of(:postal_code).is_equal_to(5) }


    it { should have_valid(:description).when('Roach motel') }

    it { should have_valid(:owner_id).when(1, 2) }
  end

  context 'associations' do
    it { should belong_to(:owner) }
  end
end
