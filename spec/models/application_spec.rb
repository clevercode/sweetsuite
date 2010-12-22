require 'spec_helper'

describe Application do

  before(:each) do
    @application = Factory(:application)
  end
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:callback_url) }
  it { should_not allow_mass_assignment_of(:api_key) }

end
