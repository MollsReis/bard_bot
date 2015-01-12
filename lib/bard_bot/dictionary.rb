module BardBot
  class Dictionary

    def initialize(config)
      @config = config
      load_corpus!
    end

    def load_corpus!
      if @config.character_directory == :default
        directory = File.join(File.dirname(__FILE__), '..', '..', 'data')
      else
        directory = @config.character_directory
      end
      file_path = File.join(File.split(directory) << @config.character.to_s + '.txt')
      corpus = File.read(file_path).split
      prefix = @config.prefix.to_i
      @dictionary = Hash.new { |h,k| h[k] = [] }
      until corpus.length < (prefix + 1)
        key = corpus.first(prefix).join
        @dictionary[key] << corpus[prefix]
        corpus.shift
      end
    end

    def generate_sentence
      tuple = @dictionary.keys.sample
      sentence = tuple
      @config.max_length.times do
        sentence += ' ' + @dictionary[tuple].sample
        break if %w[? ! .].include?(sentence[-1])
        tuple = sentence.split.last(2).join
      end
      sentence.downcase.capitalize
    end

  end
end
