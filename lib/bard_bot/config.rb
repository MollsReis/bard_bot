module BardBot
  class Config
    attr_accessor :character, :prefix, :max_length, :character_directory

    def initialize
      @character = :hamlet
      @prefix = 2
      @max_length = 100
      @character_directory = :default
    end

  end
end
