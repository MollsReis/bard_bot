module BardBot
  class Dictionary

    def initialize(character)
      @character = character
      load_corpus!
    end

    def load_corpus!
      @dictionary = Hash.new { |h,k| h[k] = [] }
      file_path = File.join(File.dirname(__FILE__), '..', '..', 'data', @character.to_s + '.txt')
      corpus = File.read(file_path).split
      until corpus.length < 3
        @dictionary["#{corpus[0]} #{corpus[1]}"] << corpus[2]
        corpus.shift
      end
    end

    def generate_sentence
      tuple = @dictionary.keys.sample
      sentence = tuple
      100.times do
        sentence += ' ' + @dictionary[tuple].sample
        break if %w[? ! .].include?(sentence[-1])
        tuple = sentence.split.last(2).join
      end
      sentence.downcase.capitalize
    end

  end
end
