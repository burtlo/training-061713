require 'contact_agent'
require 'pp'
require 'debugger'

puts ContactAgent::VERSION

agent = ContactAgent::Client.new(url: "http://localhost:3000")

people = agent.people

#pp people
puts "======================"
first_person =  people.first

puts first_person.class
puts first_person.name
puts first_person.phone_numbers.first.number
puts first_person.primary_phone_number