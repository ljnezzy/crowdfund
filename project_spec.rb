require_relative 'project'
require_relative 'spec_helper'

describe Projects do
  before do
    @initial_funds = 1000
    @project = Projects.new("Project ABC", @initial_funds, 5000) 
    $stdout = StringIO.new
  end
  
  it "has an initial target funding amount" do
    @project.target.should == 5000
  end
  
  it "computes the total funds outstanding as the target funding amount minus the funding amount" do    
    @project.funding_needed.should == (5000 - 1000)
  end

  it "increases funds by 10 when funds are added" do
    @project.add_funds(10)
    
    @project.funding.should == @initial_funds + 10
  end
  
  it "decreases funds by 10 when funds are removed" do
    @project.remove_funds(10)
    
    @project.funding.should == @initial_funds - 10
  end

  context "created without a funding amount" do
    before do
      @project = Projects.new("Project ABC", 5000)
    end
    
    it "has a default funding amount of 0" do
      @project.funding.should == 0
    end
  end

end