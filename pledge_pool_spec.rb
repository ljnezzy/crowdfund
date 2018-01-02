require_relative 'pledge_pool'

describe Pledge do
  
  before do
    @pledge = Pledge.new(:lightweight, 50)
  end
  
  it "has a name attribute" do
    @pledge.name.should == :lightweight
  end
  
  it "has an amount attribute" do
    @pledge.amount.should == 50
  end
  
end

describe PledgePool do
  
  it "has three pledges" do
    PledgePool::PLEDGES.size.should == 3
  end
  
  it "has a lightweight pledge worth $50" do
    PledgePool::PLEDGES[0].should == Pledge.new(:lightweight, 50)
  end
  
  it "has a middleweight pledge worth 75 points" do
    PledgePool::PLEDGES[1].should == Pledge.new(:middleweight, 75)
  end
  
  it "has a heavyweight pledge worth 100 points" do
    PledgePool::PLEDGES[2].should == Pledge.new(:heavyweight, 100)
  end
  
  it "returns a random pledge" do
    pledge = PledgePool.random
    
    PledgePool::PLEDGES.should include(pledge)
  end

end
