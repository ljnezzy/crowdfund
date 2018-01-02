Pledge = Struct.new(:name, :amount)

module PledgePool
  PLEDGES = [
    Pledge.new(:lightweight, 50),
    Pledge.new(:middleweight, 75),
    Pledge.new(:heavyweight,  100)
  ]
    
  def self.random
    PLEDGES.sample
  end
    
end
