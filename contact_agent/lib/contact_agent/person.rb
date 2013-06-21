module ContactAgent

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

end