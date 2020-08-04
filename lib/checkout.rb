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
      discount_rule = discount_rules.dig(item)
      discounted_items = discount_item_count(count, discount_rule)

      total += (prices.fetch(item)) * (count - discounted_items)
    end

    total
  end

  private

  def discount_item_count(quantity, discount_rule)
    return 0 unless discount_rule

    items_in_package = discount_rule[:package_item]
    max_items = discount_rule[:max_item_discount_limit]

    quantity = max_quantity(quantity, max_items) if max_items

    if discount_rule[:discount_type] == 'even_quantity'
      return 0 unless (quantity % 2).zero?
    end

    quantity / items_in_package
  end

  def max_quantity(quantity, max_items)
    quantity > max_items ? max_items : quantity
  end

  def basket
    @basket ||= Hash.new(0)
  end
end
