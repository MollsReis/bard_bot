require 'spec_helper'

module BardBot
  describe Config, '#initialize' do
    it 'creates a new config with defaults' do
      config = Config.new
      expect(config.instance_variable_get(:@character)).to eq :hamlet
      expect(config.instance_variable_get(:@prefix)).to eq 2
      expect(config.instance_variable_get(:@max_length)).to eq 100
      expect(config.instance_variable_get(:@character_directory)).to eq :default
    end
  end
end
