require_relative "test_helper"

class TestController < Tracks::Controller
  def index
    "Hello!" # just returning a string, new using the view renderer
  end
end

class TestApp < Tracks::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class TracksAppTest < Test::Unit::TestCase

  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/example/route"
    assert last_response.ok?
    assert last_response.body["Hello"]
  end

end
