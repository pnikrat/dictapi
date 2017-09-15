require './words_database'

describe 'trie' do
  before :all do
    WordsDatabase.init('./spec/test_data.dict')
  end

  context 'word insert and retrieval' do
    let(:db) { WordsDatabase }
    it 'returns proper pronounce for simple word' do
      expect(db.get_pronounce('cheaper')).to eq 'CHIY1PER0'
    end

    it 'returns proper pronounce for word with special character' do
      expect(db.get_pronounce('non-performing')).to eq 'NAA0NPER0FAO1RMIH0NG'
    end

    it 'has correct behaviour when word has two pronounciations' do
      # implement two pronounciations as array of strings?
      expect(db.get_pronounce("job's(2)")).to eq 'JHOW1BZ'
    end

    it 'returns nil when asked for word that does not exist' do
      expect(db.get_pronounce('foooo')).to eq nil
    end
  end
end
