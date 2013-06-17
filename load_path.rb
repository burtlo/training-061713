puts "DEFAULT PATH"
puts $LOAD_PATH

# Change the load path to look locally

# puts __FILE__
# puts File.dirname(__FILE__)

dir = File.dirname(__FILE__)


unless $LOAD_PATH.include?(dir)
  $LOAD_PATH.unshift(dir)
end

puts "NEW LOAD PATH"
puts $LOAD_PATH

require 'csv'
