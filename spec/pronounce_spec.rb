require './app/application'

describe 'pronounce_controller' do
  let(:app) { Application.new }

  context 'root path endpoint' do
    let(:response) { get '/' }
    it 'has status code of 404' do
      expect(response.status).to eq 404
    end
  end

  context '/pronounce/:word endpoint' do
    let(:response) { get '/pronounce/abandon' }
    let(:bad_response) { get '/pronounce/fooooooooooooooooo' }

    it 'has status code of 200' do
      expect(response.status).to eq 200
    end

    it 'has proper body content' do
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['abandon']).to eq 'AH0BAE1NDAH0N'
    end

    it 'contains proper content type header' do
      expect(response.header['Content-Type']).to eq 'application/json'
    end

    it 'has status code of 404 for resources that dont exist' do
      expect(bad_response.status).to eq 404
    end
  end
end
