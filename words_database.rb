require './model/trie'
require 'pry'
# Static class containing words' dictionary in a trie data structure
module WordsDatabase
  def self.init(_filename)
    trie = Trie.new
    trie.add_word('alap', 'DSFE1Y3W')
    trie.add_word("'cause", 'KWEY1Z')
  end

  def self.get_word(_word)
    'false'
  end
end
