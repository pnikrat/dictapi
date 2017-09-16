# Default controller behaviour, inherited by suggest and pronounce controllers
class DefaultController
  def prepare_response
    @response = Rack::Response.new
    construct_json
    if @body == 'null'
      prepare_404_response
    else
      prepare_200_response
    end
    @response.finish
  end

  def prepare_404_response
    @response.write('Resource does not exist')
    @response['Content-Type'] = 'text/html'
    @response.status = 404
  end

  def prepare_200_response
    @response.write(@body)
    @response['Content-Type'] = 'application/json'
  end
end
