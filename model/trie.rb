require './model/trie_node'
# Trie data structure
class Trie
  def initialize
    @root = TrieNode.new(nil)
  end

  def add_word(word, value)
    @root.insert(word, value)
  end

  def get_pronounce(word)
    @root.find(word)
  end

  def get_suggestions(prefix)
    @root.suggest(prefix)
  end
end
