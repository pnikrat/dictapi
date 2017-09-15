# tbd
class SuggestController
  def initialize(prefix)
    @prefix = prefix
  end

  def prepare_response
    [404, {}, ['Not implemented yet']]
  end
end
