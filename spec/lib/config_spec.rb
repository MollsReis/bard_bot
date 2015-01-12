require 'spec_helper'

module BardBot
  describe Config do

    let(:config) { Config.new }

    describe '#initialize' do
      it 'creates a new config with defaults' do
        expect(config.instance_variable_get(:@character)).to eq :hamlet
        expect(config.instance_variable_get(:@prefix)).to eq 2
        expect(config.instance_variable_get(:@max_length)).to eq 100
        expect(config.instance_variable_get(:@character_directory)).to eq :default
      end
    end

    describe '#character_directory' do
      it 'returns the default character directory' do
        expect(config.character_directory.split(File::SEPARATOR).last(3)).to eq %w[ .. .. data ]
      end

      it 'returns the specified charcter directory' do
        config.character_directory = '/foo/bar'
        expect(config.character_directory).to eq '/foo/bar'
      end
    end

  end
end
