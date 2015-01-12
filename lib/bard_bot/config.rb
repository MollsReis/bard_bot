module BardBot
  class Config
    attr_accessor :character, :prefix, :max_length
    attr_writer :character_dir

    def initialize
      @character = :hamlet
      @prefix = 2
      @max_length = 100
      @character_dir = :default
    end

    def character_dir
      if @character_dir == :default
        return File.join(File.dirname(__FILE__), '..', '..', 'data')
      end
      @character_dir
    end
  end
end
