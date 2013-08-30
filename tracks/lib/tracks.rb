require "tracks/version"
require "tracks/string"

module Tracks

  class Application

    def call(env)
      `echo debug > debug.txt`;
      [200, {'Content-Type' => 'text/plain'}, ["You are using Ruby on Tracks"]]
    end

  end

end
