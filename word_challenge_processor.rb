require 'set'

def process_word_challenge(dictionary_file_name)
  found_sequences = {}
  blacklist = Set.new []

  IO.readlines(dictionary_file_name).each do |w|
    # binding.pry
    word = w.gsub(/[^%a-z]/, '').downcase
    0.upto(word.length - 4) do |sequence_start|
      sequence = word.slice(sequence_start, 4)
      if sequence.length == 4
        unless blacklist.include? sequence
          if found_sequences.include? sequence
            found_sequences.delete sequence
            blacklist << sequence
          else
            found_sequences[sequence] = word
          end
        end
      end
    end
  end

  sequence_file = File.open('sequences.txt', 'w')
  words_file = File.open('words.txt', 'w')

  found_sequences.each do |key, value|
    sequence_file.puts key
    words_file.puts value
  end

  sequence_file.close
  words_file.close

  return found_sequences
end
