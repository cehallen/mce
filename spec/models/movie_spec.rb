require 'spec_helper'

describe Movie do
  context 'validations' do
    it { should have_valid(:title).when('The Matrix') }
    it { should_not have_valid(:title).when('', nil) }

    it { should_not have_valid(:subtitle_file_url).when(nil, '') }   
  end

  context 'associations' do
    it { should have_many(:sentences).dependent(:destroy) }
    it { should have_many(:sjoinws).through(:sentences) }
    it { should have_many(:words).through(:sjoinws) }
    it { should belong_to(:user) }
  end
end
