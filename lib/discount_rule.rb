class DiscountRule
  DISCOUNT_RULES = {
    apple: { package_item: 2.0 },
    pear: { package_item: 2.0 },
    banana: { package_item: 2.0 },
    pineapple: { package_item: 2.0 },
    mango: { package_item: 4 }
  }

  def self.rules
    DISCOUNT_RULES
  end
end
