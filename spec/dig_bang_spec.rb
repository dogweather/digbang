# frozen_string_literal: true
require 'spec_helper'
require 'dig_bang'

DOG = {
  name: 'Phoebe',
  age: 7,
  vaccinations: {
    '2011-07-20' => :all
  }
}.freeze

DOGS = [DOG].freeze


describe Array do
  describe '#dig!' do
    it 'returns an existing element' do
      expect( DOGS.dig!(0) ).to eq DOG
    end

    it 'raises IndexError for a non-existing element' do
      expect { DOGS.dig!(1) }.to raise_error(IndexError, /1/)
    end

    it 'returns a sub-element in a sub-hash' do
      expect( DOGS.dig!(0, :name) ).to eq 'Phoebe'
    end

    it 'raises a KeyError if a key is not found in a sub-hash' do
      expect { DOGS.dig!(0, :weight) }.to raise_error(KeyError, /weight/)
    end
  end
end

describe Hash do
  describe '#dig!' do
    it 'returns an existing key/value' do
      expect( DOG.dig!(:name) ).to eq 'Phoebe'
    end

    it 'returns an existing key/value from a list' do
      expect( DOG.dig!(:vaccinations, '2011-07-20') ).to eq :all
    end

    it 'raises a KeyError if a key is not found' do
      expect { DOG.dig!(:weight) }.to raise_error(KeyError, /weight/)
    end

    it 'raises a KeyError if a sub-key is not found' do
      expect {
        DOG.dig!(:vaccinations, '2012-01-01')
      }.to raise_error(KeyError, /2012-01-01/)
    end
  end
end
