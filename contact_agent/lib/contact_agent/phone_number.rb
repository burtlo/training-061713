module ContactAgent

  class PhoneNumber
    attr_accessor :number

    def initialize(hash)
      @number = hash['number']
    end
  end

end