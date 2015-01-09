require 'spec_helper'

module BardBot
  describe Dictionary do

    describe '#initialize' do
      it 'creates a new dictionary' do
        dictionary = Dictionary.new(:foo)
        expect(dictionary).to be_an_instance_of Dictionary
        expect(dictionary.instance_variable_get(:@character)).to eq :foo
      end
    end

  end
end
