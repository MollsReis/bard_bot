module BardBot
  class Config
    attr_accessor :character, :prefix, :max_length
    attr_writer :character_directory

    def initialize
      @character = :hamlet
      @prefix = 2
      @max_length = 100
      @character_directory = :default
    end

    def character_directory
      return File.join(File.dirname(__FILE__), '..', '..', 'data') if @character_directory == :default
      @character_directory
    end

  end
end
