require 'spec_helper'
require 'scanner'

RSpec.describe Scanner do
  subject(:scanner) { described_class.new }

  describe '#scan' do
    context 'when there is no item scanned' do
      it 'returns empty hash' do
        expect(scanner.basket).to eq({})
      end
    end

    context 'when there is only one item scanned' do
      let(:basket) { { apple: 1 } }

      it 'returns the list of scanned items with count' do
        scanner.scan(:apple)
        expect(scanner.basket).to eq(basket)
      end
    end

    context 'when there are multiple item scanned' do
      let(:basket) { { apple: 1, mango: 2 } }

      it 'returns the list of scanned items with count' do
        scanner.scan(:apple)
        scanner.scan(:mango)
        scanner.scan(:mango)
        expect(scanner.basket).to eq(basket)
      end
    end
  end
end
