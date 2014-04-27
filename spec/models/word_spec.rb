require 'spec_helper'

describe Word do
  context 'validations' do
    it { should have_valid(:content).when('The') }
    it { should_not have_valid(:content).when('', nil) } 
  end

  context 'associations' do
    it { should have_many(:sjoinws) }
    it { should have_many(:sentences).through(:sjoinws) }
    it { should have_many(:movies).through(:sentences) }
  end
end
