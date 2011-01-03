require 'spec_helper'

describe AccessGrant do

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:application) }
  end

end
