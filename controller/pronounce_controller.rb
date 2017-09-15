require 'json'
# Prepares responses for requests made to '/pronounce/:word endpoint'
class PronounceController
  def initialize(word)
    @word = word
  end

  def prepare_response
    response = Rack::Response.new
    construct_json
    response.write(@body)
    response['Content-Type'] = 'application/json'
    response.finish
  end

  def construct_json
    @body = JSON.pretty_generate(@word => WordsDatabase.get_pronounce(@word))
  end
end
