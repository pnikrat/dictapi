# tbd
class SuggestController
  def initialize(prefix)
    @prefix = prefix
  end

  def prepare_response
    WordsDatabase.get_suggestions(@prefix)
    # [404, {}, ['Not implemented yet']]
  end
end
