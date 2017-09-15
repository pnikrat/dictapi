# Single trie node. May contain value - pronounciation of the word
class TrieNode
  attr_reader :key, :value
  attr_accessor :suggestions
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

  def find(word)
    return @value if word.length.zero?
    traverse_trie(word) { |w, node| node.find(w[1..-1]) }
  end

  def suggest(prefix)
    return collect_suggestions if prefix.length.zero?
    traverse_trie(prefix) { |pre, node| node.suggest(pre[1..-1]) }
  end

  private

  def determine_next_node(char)
    @children.each { |n| return n if n.key == char }
    nil
  end

  def traverse_trie(word)
    next_node = determine_next_node(word[0])
    return nil if next_node.nil?
    yield(word, next_node)
  end

  def collect_suggestions
    @suggestions = {}
    @suggestions['_'] = @value unless @value.nil?
    search_children(self, '')
    @suggestions
  end

  protected

  def search_children(start_node, previous_char)
    @children.each do |child|
      break if start_node.suggestions.length >= 10
      if child.value.nil?
        child.search_children(start_node, previous_char + child.key)
      else
        start_node.suggestions['_' + previous_char + child.key] = child.value
      end
    end
  end
end
