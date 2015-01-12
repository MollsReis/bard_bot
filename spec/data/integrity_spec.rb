require 'spec_helper'

describe 'Integrity' do
  it 'tests data readability' do
    BardBot.characters.each do |character|
      BardBot.config.character = character
      expect { BardBot.generate_sentence }.to_not raise_exception
    end
  end
end
