module Fruit
  module Weather
    extend self

    def report(fruit)
      growth_range(fruit).call
    end

    def growth_range(type)
      @growth_range ||= begin
        hash = Hash.new
        hash.default = lambda { sleep 12; 0 }
        hash[:apple] = lambda { sleep 8; rand(5..9) }
        hash
      end

      @growth_range[type]
    end
  end
end