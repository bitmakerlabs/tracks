require "tracks/version"

module Tracks

  class Application

    def call(env)
      [200, {'Content-Type' => 'text/plain'}, ["You are using Ruby on Tracks"]]
    end

  end

end
