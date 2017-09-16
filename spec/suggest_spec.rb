require './app/application'

describe 'suggest controller' do
  let(:app) { Application.new }

  context '/suggest/:prefix endpoint' do
    let(:response) { get '/suggest/abide' }
    let(:bad_response) { get '/suggest/fooooooooooooooo' }

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

    it 'has status code of 404 for resources that dont exist' do
      expect(bad_response.status).to eq 404
    end
  end
end
