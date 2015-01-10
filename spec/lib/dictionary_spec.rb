require 'spec_helper'

module BardBot
  describe Dictionary do

    describe '#initialize' do
      it 'creates a new dictionary' do
        expect_any_instance_of(Dictionary).to receive(:load_corpus!).and_return(nil)
        dictionary = Dictionary.new(:foo)
        expect(dictionary).to be_an_instance_of Dictionary
        expect(dictionary.instance_variable_get(:@character)).to eq :foo
      end
    end

    describe '#load_corpus!' do
      it 'loads the corpus into the dictionary' do
        expect(File).to receive(:read).and_return('foo bar baz bbq')
        dictionary = Dictionary.new(:foo)
        expected = { 'foo bar' => %w[ baz ], 'bar baz' => %w[ bbq ] }
        expect(dictionary.instance_variable_get(:@dictionary)).to eq expected
      end
    end

    describe '#generate_sentence' do
      it 'generates a sentence using a markov chain from the dictionary' do
        expect(File).to receive(:read).and_return('foo bar baz!')
        actual = Dictionary.new(:foo).generate_sentence
        expect(actual).to eq 'Foo bar baz!'
      end
    end

  end
end
