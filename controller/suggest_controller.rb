require 'json'
require './controller/default_controller'
# Prepares responses for requests made to '/suggest/:prefix' endpoint
class SuggestController < DefaultController
  def initialize(prefix)
    @prefix = prefix
  end

  def construct_json
    @body = JSON.pretty_generate(WordsDatabase.get_suggestions(@prefix))
  end
end
