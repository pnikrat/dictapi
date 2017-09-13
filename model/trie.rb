require './model/trie_node'
# Trie data structure
class Trie
  def initialize
    @root = TrieNode.new(nil)
  end

  def add_word(word, value)
    @root.insert(word, value)
  end
end
