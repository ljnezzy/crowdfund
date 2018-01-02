require_relative 'project'

class Grants < Projects
  def remove_funds(amount)
    @funding -= 0
    puts "#{@name} has not recieved any additional funding."
  end
  def add_funds(amount)
    grant_amount =amount/2
    @funding += grant_amount
    puts "#{@name} recieved $#{grant_amount} in grant funding!"
  end
end

if __FILE__ == $0
  grant = Grants.new("Project 123", 100, 500)
  
  puts "#{grant.name} has $#{grant.total_funds} in funding towards a goal of $#{grant.target}."
  grant.remove_funds(25)
  puts "#{grant.name} has $#{grant.total_funds} in funding towards a goal of $#{grant.target}."
  grant.add_funds(200)
  puts "#{grant.name} has $#{grant.total_funds} in funding towards a goal of $#{grant.target}."

end