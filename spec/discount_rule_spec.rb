require 'spec_helper'
require 'discount_rule'

RSpec.describe DiscountRule do
  let(:discount_rule) { DiscountRule::DISCOUNT_RULES }

  describe '#rules' do
    it 'returns the list of discount rules' do
      expect(described_class.rules).to eq(discount_rule)
    end
  end
end
