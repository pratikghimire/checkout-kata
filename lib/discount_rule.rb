class DiscountRule
  DISCOUNT_RULES = {
    apple: { package_item: 2.0, discount_type: 'even_quantity' },
    pear: { package_item: 2.0, discount_type: 'even_quantity' },
    banana: { package_item: 2.0, discount_type: nil },
    pineapple: { package_item: 2.0, discount_type: nil },
    mango: { package_item: 4, discount_type: nil }
  }

  def self.rules
    DISCOUNT_RULES
  end
end
