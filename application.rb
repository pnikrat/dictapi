# Main application
class Application
  def call(_env)
    [200, { 'Content-Type' => 'text/html' }, ['Simple Rack app']]
  end
end
