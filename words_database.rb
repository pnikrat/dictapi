require './model/trie'
require 'pry'
# Static class containing words' dictionary in a trie data structure
module WordsDatabase
  def self.init(filename)
    @trie = Trie.new
    file = IO.readlines(filename)
    file.each do |line|
      @trie.add_word(line.split[0], line.split[1..-1].join)
    end
  end

  def self.get_pronounce(word)
    @trie.get_pronounce(word)
  end

  def self.get_suggestions(prefix)
    @trie.get_suggestions(prefix)
  end
end
