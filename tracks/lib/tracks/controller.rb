require "erubis"

module Tracks

  class Controller

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {})
      template = File.read( File.join("app", "views", "#{view_name}.html.erb") )
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env)
    end

  end

end
