require_relative 'project'
require_relative 'die'
require_relative 'pledge_pool'

module RoundsOfFunding
  
  def self.one_round(project)
    die = Die.new
    number_rolled = die.roll
    if number_rolled.odd?
      project.remove_funds(25)
    else
      project.add_funds(50)
    end
    pledge = PledgePool.random
    project.rcvd_pledges(pledge)
  end
  
end