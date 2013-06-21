require 'eventmachine'
require 'faye'

EM.run do

  client = Faye::Client.new "http://localhost:3000/faye"
  client.subscribe "/card-images/create" do |data|
    puts "Received: #{data}"
    sleep 2
    client.publish "/card-images/receive", { url: "http://google.com/image.jpg" }
  end

end