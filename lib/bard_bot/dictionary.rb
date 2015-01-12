module BardBot
  class Dictionary
    def initialize(config)
      @prefix = config.prefix.to_i
      @max_length = config.max_length
      @file_path = File.join(config.character_dir, "#{config.character}.txt")
      @dictionary = Hash.new { |h, k| h[k] = [] }
      load_corpus!
    end

    def load_corpus!
      corpus = File.read(@file_path).split
      until corpus.length < (@prefix + 1)
        key = corpus.first(@prefix).join
        @dictionary[key] << corpus[@prefix]
        corpus.shift
      end
    end

    def generate_sentence
      tuple = @dictionary.keys.sample
      sentence = tuple
      @max_length.times do
        sentence += ' ' + @dictionary[tuple].sample
        break if %w( ? ! . ).include?(sentence[-1])
        tuple = sentence.split.last(2).join
      end
      sentence.downcase.capitalize
    end
  end
end
