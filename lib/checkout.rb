require 'discount_rule'

class Checkout
  attr_reader :prices, :discount_rules
  private :prices, :discount_rules

  def initialize(prices)
    @prices = prices
    @discount_rules = DiscountRule.rules
  end

  def scan(item)
    basket[item.to_sym] += 1
  end

  def total
    total = 0

    basket.each do |item, count|
      if item == :apple || item == :pear
        if (count % 2 == 0)
          total += prices.fetch(item) * (count / 2)
        else
          total += prices.fetch(item) * count
        end
      elsif item == :banana || item == :pineapple
        if item == :pineapple
          total += (prices.fetch(item) / 2)
          total += (prices.fetch(item)) * (count - 1)
        else
          total += (prices.fetch(item) / 2) * count
        end
      else
        total += prices.fetch(item) * count
      end
    end

    total
  end

  private

  def basket
    @basket ||= Hash.new(0)
  end
end
