require 'spec_helper'

describe Sjoinw do
  it { should belong_to(:word) }
  it { should belong_to(:sentence) }
end
