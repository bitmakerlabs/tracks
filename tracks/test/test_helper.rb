require "rack/test"
require "test/unit"

# ensures that local version of this gem is used if available
this_dir = File.join(File.dirname(__FILE__), "..")
$LOAD_PATH.unshift File.expand_path(this_dir)

require "tracks"
