require './controller/pronounce_controller'
require './controller/suggest_controller'
# Main application
class Application
  def call(env)
    request = Rack::Request.new(env)
    if %r{/pronounce/[\w'\.]+}.match?(request.path) && request.get?
      ctrl = PronounceController.new(extract_parameter(request.path))
    elsif %r{/suggest/[\w'\.]+}.match?(request.path) && request.get?
      ctrl = SuggestController.new(extract_parameter(request.path))
    else
      return [404, { 'Content-Type' => 'text/html' },
              ['Endpoint does not exist']]
    end
    ctrl.prepare_response
  end

  def extract_parameter(request_path)
    request_path.gsub(%r{/\w+/}, '')
  end
end
