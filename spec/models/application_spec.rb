require 'spec_helper'

describe Application do

  before(:each) do
    @application = Factory(:application)
  end

  context 'associations' do
    it { should have_many(:access_grants) }
    it { should have_many(:users).through(:access_grants) }
  end

  context 'mass assignment' do 
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:slug) }
    it { should allow_mass_assignment_of(:callback_url) }
    it { should_not allow_mass_assignment_of(:api_key) }
  end

end
