require 'spec_helper'

module BardBot
  describe Config do
    let(:config) { Config.new }

    describe '#initialize' do
      it 'creates a new config with defaults' do
        expect(config.instance_variable_get(:@character)).to eq :hamlet
        expect(config.instance_variable_get(:@prefix)).to eq 2
        expect(config.instance_variable_get(:@max_length)).to eq 100
        expect(config.instance_variable_get(:@character_dir)).to eq :default
      end
    end

    describe '#character_dir' do
      it 'returns the default character directory' do
        character_dir = config.character_dir.split(File::SEPARATOR).last(3)
        expect(character_dir).to eq %w( .. .. data )
      end

      it 'returns the specified charcter directory' do
        config.character_dir = '/foo/bar'
        expect(config.character_dir).to eq '/foo/bar'
      end
    end
  end
end
