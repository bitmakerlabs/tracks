require "tracks/version"
require "tracks/routing"
require "tracks/util"
require "tracks/dependencies"
require "tracks/string"

module Tracks

  class Application

    def call(env)

      is_root = env['PATH_INFO'] == '/'

      if is_root
        if defined?(HomeController)
          @controller, @action = HomeController.new(env), 'index'
        end
      else
        klass, @action = get_controller_and_action(env)
        @controller = klass.new(env) if klass
      end

      if defined?(@controller) && @controller && defined?(@action)
        if @controller.respond_to? @action
          resp = [200, {'Content-Type' => 'text/html'}, [@controller.send(@action)]]
        elsif is_root
          resp = [200, {'Content-Type' => 'text/html'}, ["Welcome to a new website built on Tracks."]]          
        end
      end

      resp ||= [404, {'Content-Type' => 'text/html'}, ["Sorry, page not found."]]
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
