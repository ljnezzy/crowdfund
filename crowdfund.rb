require_relative 'project'
require_relative 'fundrequest'

project1 = Projects.new("Project ABC", 1000, 5000)
project2 = Projects.new("Project LMN", 300, 500)
project3 = Projects.new("Project XYZ", 25, 75)
project4 = Projects.new("Project TBD", 10000)
projects = FundRequest.new("New Start-up Projects")
puts projects.title
projects.load_projects(ARGV.shift || "myProjects.csv")

loop do
  puts "\nHow many rounds of funding will there be today? ('quit' to exit)"
  players_answer = gets.chomp.downcase
  case players_answer
  when /^\d+$/
    projects.request_funding(players_answer.to_i)
  when 'quit', 'exit'
    projects.print_results
    break
  else
    puts "A number or quit was not entered\n   Please enter a number or 'quit'"
  end
end

projects.save_under_funded_projects

=begin
projects = FundRequest.new("New Start-up Projects")
puts projects.title
projects.add_project(project1)
projects.add_project(project2)
projects.add_project(project3)
projects.request_funding(3)
projects.print_results
=end

=begin
def time
  current_time = Time.new
  formatted_time = current_time.strftime("%A %m/%d/%Y at %I:%M%p")
end

def project_listings(name,funding=0)
  project="Project"
  "#{project} #{name.upcase} has $#{funding} as of #{time}"
end


puts project_listings("abc", 1000)
puts project_listings("lmn", 800)
puts project_listings("xyz", 400)
puts project_listings("TBD")
=end
=begin
project= 'Project'
project1= 'ABC'
project2= 'LMN'
project3= 'XYZ'

funding1 = 1000
funding2 = 800
funding3 = 400

puts "#{project}:".ljust(30, ' ')+ "Funding"
puts "  #{project1.ljust(30, '.')} #{funding1}"
puts "  #{project2.ljust(30, '.')} #{funding2}"
puts "  #{project3.ljust(30, '.')} #{funding3}"

puts "#{project}'s: \n\t#{project1}\n\t#{project2}\n\t#{project3}"

current_time = Time.new
formatted_time = current_time.strftime("%A %m/%d/%Y at %I:%M%p")
puts "The current Funding of each #{project} as of #{formatted_time}"
=end
