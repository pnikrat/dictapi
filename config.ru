require './application'
require './words_database'
WordsDatabase.init('cmudict.dict')
run Application.new
