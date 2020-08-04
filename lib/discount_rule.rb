class DiscountRule
  DISCOUNT_RULES = {
    apple: { package_item: 2.0, discount_type: 'even_quantity', max_item_discount_limit: nil },
    pear: { package_item: 2.0, discount_type: 'even_quantity', max_item_discount_limit: nil },
    banana: { package_item: 2.0, discount_type: nil, max_item_discount_limit: nil },
    pineapple: { package_item: 2.0, discount_type: nil, max_item_discount_limit: 1 },
    mango: { package_item: 4, discount_type: nil, max_item_discount_limit: nil }
  }

  def self.rules
    DISCOUNT_RULES
  end
end
