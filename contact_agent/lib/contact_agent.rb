require "faraday"
require "multi_json"
require "oj"
require "hashie"

require "contact_agent/version"
require "contact_agent/person"
require "contact_agent/phone_number"

module ContactAgent

  class Client

    #
    # @params [Hash] options contains the url parameter and other parameters
    #   that I may need to connect the client to the contact manager service
    #
    def initialize(options={})
      @connection = Faraday.new(options)
    end

    def people
      # make an http request to the url provided
      response = @connection.get "/people.json"
      # return the people response
      puts "WHAT IS GOING ON HERE: #{response.inspect}"
      result = MultiJson.load response.body

      result["people"].map { |person| Person.new(person) }
    end
  end
end
