require "tracks/version"
require "tracks/routing"
require "tracks/string"

module Tracks

  class Application

    def call(env)

      return [404, {'Content-Type' => 'text/html'}, []] if env['PATH_INFO'] == '/favicon.ico'

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]

    end

  end

  class Controller
    def initialize(env)
      @env = env
    end
    def env
      @env
    end
  end

end
