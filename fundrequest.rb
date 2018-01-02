require_relative 'project'
require_relative 'rounds_of_funding'
require_relative 'pledge_pool'


class FundRequest
  
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
  end
  
  def add_project(a_project)
    @projects.push(a_project)
  end
  
  def request_funding(rounds)
    puts "There are #{@projects.size} projects that you could fund:"
    @projects.each do |project|
      puts project
    end
    
    pledges = PledgePool::PLEDGES
    puts "\nThere are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "A #{pledge.name} pledge is worth $#{pledge.amount}."
    end
    
    1.upto(rounds) do |round|
      puts "\nFunding Round #{round}:"
        @projects.each do |project|
        RoundsOfFunding.one_round(project)
        puts project 
    end
  end
end

  def print_name_and_funding(project)
    puts "#{project.name} ($#{project.funding})"
  end
  
  def fully_funded_projects
    @projects.select { |project| project.funded }
  end
  
  def under_funded_projects
    @projects.reject { |project| project.funded }
  end
  
  def print_results
    funded_projects = @projects.select { |project| project.funded }
    under_funded_projects = @projects.reject { |project| project.funded }
    
    puts "\n#{funded_projects.size} Funded Projects:"
    funded_projects.each do |project|
      print_name_and_funding(project)
    end    
    
    puts "\n#{under_funded_projects.size} Under-funded Projects:"
    under_funded_projects.each do |project|
      print_name_and_funding(project)
    end
    
    sorted_projects = under_funded_projects.sort { |a, b| b.funding_needed <=> a.funding_needed}
    
    puts "\n#{under_funded_projects.size} projects still need your help:"
    sorted_projects.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "#{formatted_name} $#{project.funding_needed} under"
    end
    
    @projects.each do |project|
      puts "\n#{project.name}'s pledges:"
      project.each_rcvd_pledge do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end
      puts "$#{project.pledges} in total pledges"
    end

  end
  def sorted_under_funded_projects
    under_funded_projects.sort { |a, b| b.funding_needed <=> a.funding_needed}
  end
  
  def load_projects(from_file)
    File.readlines(from_file).each do |line|
      name, ititial_funding, target_funding = line.split(',')
      project = Projects.new(name, Integer(ititial_funding), Integer(target_funding))
      add_project(project)
    end
  end
  
  def save_under_funded_projects(to_file="needmoremoney.txt")
    File.open(to_file, "w") do |file|
      file.puts "These projects still need your help:"
      sorted_under_funded_projects.each do |project|
        formatted_name = project.name.ljust(20, '.')
        file.puts "#{formatted_name} $#{project.funding_needed} under"
      end
    end
  end
end
