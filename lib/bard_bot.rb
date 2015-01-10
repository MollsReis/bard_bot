$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'bard_bot'))
%w[config dictionary].each { |klass| require klass }

require 'english'
$FIELD_SEPARATOR = ' '
$OUTPUT_FIELD_SEPARATOR = ' '

module BardBot
  class << self

    def config
      @config ||= Config.new
      yield @config if block_given?
      @config
    end

    def dictionaries
      @dictionaries ||= Hash.new do |h,char|
        h[char] = Dictionary.new(config.character)
      end
      yield @dictionaries if block_given?
      @dictionaries
    end

    def generate_sentence
      dictionaries[config.character].generate_sentence
    end

    def method_missing(meth)
      if meth.match /^generate_(\d+)_sentences$/
        return Array.new.fill(0...$1.to_i) { generate_sentence }.join
      end
      super
    end

  end
end
