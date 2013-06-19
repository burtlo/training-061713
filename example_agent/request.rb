require 'contact_agent'

puts ContactAgent::VERSION

agent = ContactAgent::Client.new(url: "http://localhost:3000")

people = agent.people

puts people
puts "======================"
puts people["people"].first["name"]