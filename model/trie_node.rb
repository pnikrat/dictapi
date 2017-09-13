# Single trie node. May contain value - pronounciation of the word
class TrieNode
  attr_reader :key
  def initialize(char)
    @key = char
    @children = []
    @value = nil
  end

  def insert(word, value)
    next_node = determine_next_node(word[0])
    if next_node.nil? && word.length >= 1
      next_node = TrieNode.new(word[0])
      @children.push(next_node)
    end
    next_node.insert(word[1..-1], value) if word.length >= 1
    @value = value if word.length.zero?
  end

  def determine_next_node(char)
    @children.each { |n| return n if n.key == char }
    nil
  end
end
