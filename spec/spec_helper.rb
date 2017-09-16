require 'rack/test'
require './model/words_database'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:suite) do
    WordsDatabase.init('./spec/test_data.dict')
  end
end
