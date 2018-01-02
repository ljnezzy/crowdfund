require_relative 'pledge_pool'

class Projects 
  
  attr_accessor :name
  attr_reader :funding, :target
  
  def initialize (name, ititial_funding=0, target_funding)
    @name=name
    @funding=ititial_funding
    @target=target_funding
    @rcvd_pledges = Hash.new(0)
  end
  
  def to_s
    "#{@name} has $#{@funding} in funding towards a goal of $#{@target} with additional funds needed $#{funding_needed}." 
  end
  
  def remove_funds(amount)
    @funding -= amount
    puts "#{@name} lost $#{amount} in funding!"
  end
  
  def add_funds(amount)
    @funding += amount
    puts "#{@name} recieved $#{amount} in funding!"
  end
  
  def funding_needed
    @target - total_funds
  end
  
  def funded
    funding_needed <= 0
  end 
  
  def rcvd_pledges(pledge)
    @rcvd_pledges[pledge.name] += pledge.amount
    puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@rcvd_pledges}"
  end
  
  def pledges
    @rcvd_pledges.values.reduce(0, :+)
  end
  
  def total_funds
    @funding + pledges
  end
  
  def each_rcvd_pledge
    @rcvd_pledges.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end
end


if __FILE__ == $0
  project = Projects.new("Project ABC", 5000, 1000)
  a=10
  b=15
  c=20
  puts project.name
  puts project.funding
  project.remove_funds(a)
  puts project.funding
  project.add_funds(c)
  puts project.funding
end