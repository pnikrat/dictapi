# Default controller behaviour, inherited by suggest and pronounce controllers
class DefaultController
  def prepare_response
    response = Rack::Response.new
    construct_json
    if @body == 'null'
      response.write('Resource does not exist')
      response['Content-Type'] = 'text/html'
    else
      response.write(@body)
      response['Content-Type'] = 'application/json'
    end
    response.finish
  end
end
