class PhoneyController < Tracks::Controller

  def a_phone
    render :a_phone, :noun => 'battery'
  end

  def phone_1
    phone_1 = Tracks::Model::FileModel.find(1)
    render :phone, :obj => phone_1
  end

  def bad_method
    begin
      raise "oh noes!"
    rescue
      "An error has occured.<br />Sorry!"
    end
  end

end
