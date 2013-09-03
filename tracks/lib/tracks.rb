require_relative "tracks/version"
require_relative "tracks/routing"
require_relative "tracks/util"
require_relative "tracks/dependencies"
require_relative "tracks/controller"
require_relative "tracks/string"

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
        if klass
          @controller = klass.new(env)
        end
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

end
