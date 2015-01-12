# BardBot
# Author::    R. Scott Reis  (https://github.com/EvilScott)
# Copyright:: Copyright (c) 2014 R. Scott Reis
# License::   MIT (http://opensource.org/licenses/MIT)

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'bard_bot'))
%w( config dictionary ).each { |klass| require klass }

require 'english'
$FIELD_SEPARATOR = ' '
$OUTPUT_FIELD_SEPARATOR = ' '

module BardBot
  VERSION = '1.0.0'

  class << self
    def config
      @config ||= Config.new
      yield @config if block_given?
      @config
    end

    def dictionaries
      @dictionaries ||= Hash.new do |h, char|
        h[char] = Dictionary.new(config)
      end
      yield @dictionaries if block_given?
      @dictionaries
    end

    def clear_dictionaries!
      @dictionaries.clear
    end

    def generate_sentence
      dictionaries[config.character].generate_sentence
    end

    def characters
      Dir[config.character_dir + '/*.txt'].map do |char|
        char.split(File::SEPARATOR).last.sub('.txt', '').to_sym
      end
    end

    def method_missing(meth)
      if /^generate_(?<num>\d+)_sentences$/ =~ meth.to_s
        return Array.new.fill(0...num.to_i) { generate_sentence }.join
      end
      super
    end
  end
end
