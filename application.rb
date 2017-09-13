# Main application
class Application
  def call(_env)
    [200, { 'Content-Type' => 'text/html' }, [WordsDatabase.get_word("'cuse")]]
  end
end
