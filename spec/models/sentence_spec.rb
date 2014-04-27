require 'spec_helper'

describe Sentence do
  context 'validations' do
    it { should validate_presence_of(:movie) }

    it { should have_valid(:time_marker).when('00:22:23') }
    it { should_not have_valid(:time_marker).when('', nil) }

    it { should have_valid(:content).when('The hovitos are near') }
    it { should_not have_valid(:content).when('', nil) }

    it { should have_valid(:number).when(2) }
    it { should_not have_valid(:number).when('', nil) }
  end

  context 'associations' do
    it { should belong_to(:movie) }
    it { should have_many(:sjoinws) }
    it { should have_many(:words).through(:sjoinws) }
  end
end
