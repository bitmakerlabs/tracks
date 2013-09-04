require "erubis"
require "rack/request"
require "tracks/file_model"

module Tracks

  class Controller

    include Tracks::Model

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def request
      @request ||= Rack::Request.new(@env)
    end

    def params
      request.params
    end

    def controller_name
      Tracks.to_underscore( self.class.to_s.gsub(/Controller$/, '') )
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env)
    end

  end

end
