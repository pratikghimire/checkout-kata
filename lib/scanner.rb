class Scanner
  attr_reader :basket

  def initialize
    @basket ||= Hash.new(0)
  end

  def scan(item)
    basket[item.to_sym] += 1
  end
end
