require_relative 'fundrequest'
require_relative 'spec_helper'

describe FundRequest do

  before do
    @fundrequest = FundRequest.new("New Start-up Projects")
    
    @initial_funds = 1000
    @add_funds=(50)
    @remove_funds=(25)
    @project = Projects.new("Project ABC", @initial_funds,  5000)
    
    @fundrequest.add_project(@project)
    $stdout = StringIO.new
  end
  
  it "adds funds to a project if an even number is rolled" do
    Die.any_instance.stub(:roll).and_return(4)
    
    @fundrequest.request_funding
    
    @project.funding.should == @initial_funds + @add_funds
  end
  
  it "removes funds to a project if an odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)
    
    @fundrequest.request_funding
    
    @project.funding.should == @initial_funds - @remove_funds
  end
  
end