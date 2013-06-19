require "contact_agent/version"
require "faraday"
require "multi_json"
require "oj"
require "ostruct"

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

      result = MultiJson.load response.body

      result["people"].map do |person_hash|
        OpenStruct.new(person_hash)
      end
    end
  end
end
