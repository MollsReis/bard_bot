require 'spec_helper'

describe BardBot do

  after(:each) do
    BardBot.dictionaries { |d| d.clear }
  end

  describe '#config' do
    it 'returns the config' do
      expect(BardBot.config).to be_an_instance_of BardBot::Config
    end

    it 'yields the config' do
      BardBot.config { |c| c.character = :foo }
      expect(BardBot.config.character).to eq :foo
    end
  end

  describe '#dictionaries' do
    it 'returns the dictionaries' do
      expect(BardBot.dictionaries).to be_an_instance_of Hash
    end

    it 'yields the dictionaries' do
      BardBot.dictionaries { |d| d[:foo] = :bar }
      expect(BardBot.dictionaries[:foo]).to eq :bar
    end
  end

  describe '#generate_sentence' do
    it 'generates a sentence from the dictionary' do
      BardBot.config.character = :foo
      expect(BardBot.dictionaries[:foo]).to receive(:generate_sentence).and_return('bar')
      expect(BardBot.generate_sentence).to eq 'bar'
    end
  end

end
