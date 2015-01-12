require 'spec_helper'

module BardBot
  describe Dictionary do

    let(:fake_config) { Config.new }

    describe '#initialize' do
      it 'creates a new dictionary' do
        expect_any_instance_of(Dictionary).to receive(:load_corpus!).and_return(nil)
        dictionary = Dictionary.new(fake_config)
        expect(dictionary).to be_an_instance_of Dictionary
        expect(dictionary.instance_variable_get(:@config)).to be_an_instance_of Config
      end
    end

    describe '#load_corpus!' do
      before(:each) { expect(File).to receive(:read).and_return('foo bar baz bbq') }

      it 'loads the corpus into the dictionary' do
        dictionary = Dictionary.new(fake_config)
        expected = { 'foo bar' => %w[ baz ], 'bar baz' => %w[ bbq ] }
        expect(dictionary.instance_variable_get(:@dictionary)).to eq expected
      end

      it 'works with different prefix lengths' do
        fake_config.prefix = 1
        dictionary = Dictionary.new(fake_config)
        expected = { 'foo' => %w[ bar ], 'bar' => %w[ baz ], 'baz' => %w[ bbq ] }
        expect(dictionary.instance_variable_get(:@dictionary)).to eq expected
      end
    end

    describe '#generate_sentence' do
      it 'generates a sentence using a markov chain from the dictionary' do
        expect(File).to receive(:read).and_return('foo bar baz!')
        actual = Dictionary.new(fake_config).generate_sentence
        expect(actual).to eq 'Foo bar baz!'
      end
    end

  end
end
