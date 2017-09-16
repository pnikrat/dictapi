require 'json'
require './controller/default_controller'
# Prepares responses for requests made to '/pronounce/:word endpoint'
class PronounceController < DefaultController
  def initialize(word)
    @word = word
  end

  def construct_json
    @body = JSON.pretty_generate(@word => WordsDatabase.get_pronounce(@word))
  end
end
