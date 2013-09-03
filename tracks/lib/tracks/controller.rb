require "erubis"

module Tracks

  class Controller

    def initialize(env)
      @env = env
    end

    def env
      @env
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