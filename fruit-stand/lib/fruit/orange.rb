module Fruit

  class Orange
    def initialize
      @total_slices = Array.new(default_total_slices)
    end

    include Sliceable
  end
end