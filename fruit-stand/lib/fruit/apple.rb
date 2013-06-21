module Fruit

  class Apple
    attr_reader :variety

    def initialize(variety=default_variety)
      @variety = variety
      @birthdate = Time.now
    end

    def size
      @size ||= Array.new(Weather.report(:apple))
    end

    def slice(amount=default_slice_amount)
      size.pop(amount).length
    end

    def remaining_slices
      size.length
    end

    def ripe?
      age > age_when_ripe
    end

    def unripe?
      !ripe?
    end

    private

    def age
      Time.now - @birthdate
    end

    def age_when_ripe
      10
    end

    def default_slice_amount
      1
    end

    def default_variety
      "Granny Smith"
    end

  end

end