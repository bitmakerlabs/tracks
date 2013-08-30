$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

require "tracks"
require "phoney_controller"

module Phoney

  class Application < Tracks::Application
  end

end
