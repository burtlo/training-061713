require "contact_agent/version"
require "faraday"
require "multi_json"
require "oj"
require "hashie"

module ContactAgent

  class PhoneNumber
    attr_accessor :number

    def initialize(hash)
      @number = hash['number']
    end
  end

  class Person

    def initialize(hash)
      @name = hash['name']
      @phone_numbers = hash['phone_numbers'].map {|phone| PhoneNumber.new(phone) }
    end

    attr_accessor :name, :phone_numbers

    def primary_phone_number
      phone_numbers.first.number
    end
  end

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

      result["people"].map { |person| Person.new(person) }
    end
  end
end
