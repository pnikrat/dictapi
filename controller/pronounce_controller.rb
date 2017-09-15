# Prepares responses for requests made to '/pronounce/:word endpoint'
class PronounceController
  def initialize(word)
    @word = word
  end

  def prepare_response
    response = Rack::Response.new
    response.write(WordsDatabase.get_pronounce(@word))
    response['Content-Type'] = 'text/html'
    response.finish
  end
end
