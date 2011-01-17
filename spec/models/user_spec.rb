require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory(:user)
  end

  context 'associations' do
    it { should have_many(:access_grants) }
  end

  context 'validations' do

  end

  context 'mass assignment' do
    it { should allow_mass_assignment_of(:first_name) }
    it { should allow_mass_assignment_of(:last_name) }
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }

    it { should_not allow_mass_assignment_of(:encrypted_password) }

  end


  context :first_name do

    it 'should assign the first name' do
      @user.first_name = 'Example'
      @user.first_name.should == 'Example'
    end

  end
end
