require 'spec_helper'

module BardBot
  describe Config, '#initialize' do
    it 'creates a new config with defaults' do
      config = Config.new.instance_variable_get(:@character)
      expect(config).to eq :hamlet
    end
  end
end
