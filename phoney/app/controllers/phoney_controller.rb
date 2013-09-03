class PhoneyController < Tracks::Controller

  def a_phone
    render :a_phone, :noun => :battery
  end

  def bad_method
    begin
      raise "oh noes!"
    rescue
      "An error has occured.<br />Sorry!"
    end
  end

end
