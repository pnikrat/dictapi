require './application'

describe 'application' do
  let(:app) { Application.new }

  context 'get to root' do
    let(:response) { get '/' }
    it 'has correct status code' do
      expect(response.status).to eq 200
    end

    it 'has proper body content' do
      expect(response.body).to include 'Simple'
    end
  end
end
