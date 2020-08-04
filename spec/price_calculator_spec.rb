require 'spec_helper'
require 'price_calculator'

RSpec.describe PriceCalculator do
  subject(:price_calculator) { described_class.new(prices) }

  let(:prices) do
    {
      apple: 10,
      orange: 20,
      pear: 15,
      banana: 30,
      pineapple: 100,
      mango: 200
    }
  end
  let(:items) do
    {
      apple: 2,
      orange: 4,
      pear: 3,
      banana: 5,
      pineapple: 2,
      mango: 7
    }
  end
  let(:quantity) { 10 }
  let(:discount_rule) {}

  describe '#total' do
    subject(:total) { price_calculator.total(items) }

    it 'applies all the discount and sums up the total amount' do
      expect(total).to eq(1560.0)
    end
  end

  describe '#discount_item_count' do
    subject(:discount_item_count) do
      price_calculator.send(:discount_item_count, quantity, discount_rule)
    end

    context 'when discount rule is empty' do
      it 'returns 0' do
        expect(discount_item_count).to eq(0)
      end
    end

    context 'when the discount rule has max item limit' do
      let(:discount_rule) do
        { package_item: 2.0, max_item_discount_limit: 1, discount_type: nil }
      end

      it 'returns the discounted item count' do
        expect(discount_item_count).to eq(0.5)
      end
    end

    context 'when the discount rule has even quantity rule' do
      let(:discount_rule) do
        { package_item: 2.0,
          max_item_discount_limit: nil,
          discount_type: 'even_quantity' }
      end

      it 'returns the discounted item count' do
        expect(discount_item_count).to eq(5)
      end
    end

    context 'when the discount rule has no rules' do
      let(:discount_rule) do
        { package_item: 4,
          max_item_discount_limit: nil,
          discount_type: nil }
      end

      it 'returns the discounted item count' do
        expect(discount_item_count).to eq(2)
      end
    end
  end

  describe '#max_quantity' do
    subject(:max_quantity) do
      price_calculator.send(:max_quantity, quantity, max_items)
    end

    context 'when quantity is more than max_items' do
      let(:max_items) { 5 }

      it 'returns ' do
        expect(max_quantity).to eq(max_items)
      end
    end

    context 'when quantity is less than max_items' do
      let(:max_items) { 50 }

      it 'returns the list of scanned items with count' do
        expect(max_quantity).to eq(quantity)
      end
    end
  end
end
