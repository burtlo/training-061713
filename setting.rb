class Setting

  def self.reset!
    @hash = { web: 12 }
  end

  def self.[](key)
    @hash[key]
  end

  def self.[]=(key,value)
    @hash[key] = value
  end
end
