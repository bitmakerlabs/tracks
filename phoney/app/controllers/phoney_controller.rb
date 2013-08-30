class PhoneyController < Tracks::Controller

  def a_phone
    "raw environment info:\n<pre>\n#{env}\n</pre>"
  end

  def bad_method
    begin
      raise "oh noes!"
    rescue
      "An error has occured.<br />Sorry!"
    end
  end

end
