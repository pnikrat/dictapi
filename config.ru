require './app/application'
require './model/words_database'
WordsDatabase.init('./model/cmudict.dict')
run Application.new
