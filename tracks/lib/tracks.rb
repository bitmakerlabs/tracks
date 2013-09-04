require "tracks/version"
require "tracks/routing"
require "tracks/util"
require "tracks/dependencies"
require "tracks/controller"
require "tracks/file_model"
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
        if klass
          @controller = klass.new(env)
        end
      end

      if defined?(@controller) && @controller && defined?(@action)
        if @controller.respond_to? @action
          text = @controller.send(@action)
          if @controller.get_response
            status, headers, rs = @controller.get_response.to_a
            resp = [status, headers, [rs.body].flatten]
          else
            resp = [200, {'Content-Type' => 'text/html'}, [text]]
          end
        elsif is_root
          resp = [200, {'Content-Type' => 'text/html'}, ["Welcome to a new website built on Tracks."]]          
        end
      end

      resp ||= [404, {'Content-Type' => 'text/html'}, ["Sorry, page not found."]]
    end

  end

end
