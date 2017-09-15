require './application'
require './words_database'

describe 'application' do
  let(:app) { Application.new }

  before :all do
    WordsDatabase.init('cmudict.dict')
  end

  context 'get to root' do
    let(:response) { get '/' }
    it 'has correct status code' do
      expect(response.status).to eq 200
    end

    it 'has proper body content' do
      expect(response.body).to include 'TRIH2PAH0LEY1'
    end
  end
end
