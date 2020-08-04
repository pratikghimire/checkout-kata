require 'price_calculator'
require 'scanner'

class Checkout
  attr_reader :prices, :scanner, :price_calculator
  private :prices, :scanner, :price_calculator

  def initialize(prices)
    @prices = prices
    @scanner = Scanner.new
    @price_calculator = PriceCalculator.new(prices)
  end

  def scan(item)
    scanner.scan(item)
  end

  def total
    price_calculator.total(scanner.basket)
  end
end
