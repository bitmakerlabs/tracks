require "tracks"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module Phoney

  class Application < Tracks::Application
  end

end
