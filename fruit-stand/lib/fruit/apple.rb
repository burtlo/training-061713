module Fruit

  module Sliceable

    def slice(amount=default_slice_amount)
      @total_slices.pop(amount).length
    end

    def remaining_slices
      @total_slices.length
    end

    def default_slice_amount
      1
    end

    def default_total_slices
      8
    end

  end

  class Apple
    attr_reader :variety

    def initialize(variety=default_variety)
      @variety = variety
      @total_slices = Array.new(default_total_slices)
    end

    include Sliceable

    def default_variety
      "Granny Smith"
    end

  end

end