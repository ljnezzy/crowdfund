require_relative 'grants'
require_relative 'spec_helper'

describe Grants do
  before do
    @initial_funds = 1000
    @project = Grants.new("Grant 123", @initial_funds, 5000)
  end
  
  it "does not ever have funds removed" do
    @project.remove_funds
    @project.funding.should == @initial_funds
  end
end
    