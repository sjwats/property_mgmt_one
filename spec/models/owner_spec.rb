require 'spec_helper'

describe Owner do
  context 'validations' do
    it { should have_valid(:first_name).when('John', 'Mike') }
    it { should_not have_valid(:first_name).when(nil, '') }

    it { should have_valid(:last_name).when('De Santo', 'Stevens') }
    it { should_not have_valid(:last_name).when(nil, '') }

    it { should have_valid(:email).when('john@watson.com') }
    it { should_not have_valid(:email).when('john', 'john.com', 'example@com', 'example@', nil, '') }

    it { should have_valid(:company_name).when('CRBC', 'Property owners Inc.') }
  end

  context 'associations' do
    it { should have_many(:buildings).dependent(:destroy) }
  end

end
