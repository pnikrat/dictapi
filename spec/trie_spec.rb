require './model/words_database'

describe 'trie word insert and retrieval' do
  before :all do
    WordsDatabase.init('./spec/test_data.dict')
  end

  let(:db) { WordsDatabase }
  it 'returns proper pronounce for simple word' do
    expect(db.get_pronounce('cheaper')).to eq 'CHIY1PER0'
  end

  it 'returns proper pronounce for word with special character' do
    expect(db.get_pronounce('non-performing')).to eq 'NAA0NPER0FAO1RMIH0NG'
  end

  it 'has correct behaviour when word has two pronounciations' do
    expect(db.get_pronounce("job's")).to include(
      'JHOW1BZ',
      'JHAA1BZ'
    )
  end

  it 'returns nil when asked for word that does not exist' do
    expect(db.get_pronounce('foooo')).to eq nil
  end
end

describe 'trie suggestions based on prefix' do
  before :all do
    WordsDatabase.init('./spec/test_data.dict')
  end

  let(:db) { WordsDatabase }
  it 'contains all suggestions when there are less than 10' do
    cheap = db.get_suggestions('cheap')
    expect(cheap).to include(
      'cheaper' => 'CHIY1PER0',
      'cheapest' => 'CHIY1PAH0ST',
      'cheaply' => 'CHIY1PLIY0'
    )
    expect(cheap.length).to eq 3
  end

  it 'contains no more than 10 suggestions if there are more than 10' do
    expect(db.get_suggestions('non-').length).to eq 10
  end

  it 'returns nil when prefix does not exist' do
    expect(db.get_suggestions('gerrr')).to eq nil
  end

  it 'contains only one suggestion in a hash if asked for a specific word' do
    expect(db.get_suggestions('gegenheimer').length).to eq 1
  end

  it 'returns multiple pronounciations words correctly among suggestions' do
    expect(db.get_suggestions('supplement')['supplementary'].length).to eq 4
  end
end
