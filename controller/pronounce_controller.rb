require 'json'
require './controller/default_controller'
# Prepares responses for requests made to '/pronounce/:word endpoint'
class PronounceController < DefaultController
  def initialize(word)
    @word = word
  end

  def construct_json
    pronounce = WordsDatabase.get_pronounce(@word)
    @body = if pronounce.nil?
              'null'
            else
              JSON.pretty_generate(@word => pronounce)
            end
  end
end
