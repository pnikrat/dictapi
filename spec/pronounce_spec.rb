require './application'
require './words_database'

describe 'pronounce_controller' do
  let(:app) { Application.new }

  before :all do
    WordsDatabase.init('cmudict.dict')
  end

  context 'root / endpoint' do
    let(:response) { get '/' }
    it 'has status code of 404' do
      expect(response.status).to eq 404
    end
  end

  context '/pronounce/:word endpoint' do
    let(:response) { get '/pronounce/abandon' }

    it 'has status code of 200' do
      expect(response.status).to eq 200
    end

    it 'has proper body content' do
      expect(response.body).to include 'AH0BAE1NDAH0N'
    end

    it 'contains proper content type header' do
      expect(response.header['Content-Type']).to eq 'text/html'
    end
  end
end
