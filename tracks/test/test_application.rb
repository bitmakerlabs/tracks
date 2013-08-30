require_relative "test_helper"

class TestApp < Tracks::Application
end

class TracksAppTest < Test::Unit::TestCase

  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"
    assert last_response.ok?
    assert last_response.body["You"]
  end

  def test_another_request
    post "/foo"
    assert last_response.ok?
    assert last_response.body["You"]
  end

end
