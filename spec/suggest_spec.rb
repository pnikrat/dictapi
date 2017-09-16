require './application'
require './words_database'

describe 'suggest controller' do
  let(:app) { Application.new }

  before :all do
    WordsDatabase.init('cmudict.dict')
  end

  context '/suggest/:prefix endpoint' do
    let(:response) { get '/suggest/abide' }

    it 'has status code of 200' do
      expect(response.status).to eq 200
    end

    it 'has proper body content' do
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['abides']).to eq 'AH0BAY1DZ'
    end

    it 'contains correct content type header' do
      expect(response.header['Content-Type']).to eq 'application/json'
    end
  end
end
