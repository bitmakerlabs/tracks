class PhoneyController < Tracks::Controller

  def index
    render :index, :phones => FileModel.all
  end

  def a_phone
    render :a_phone, :noun => 'battery'
  end

  def phone_1
    phone_1 = FileModel.find(1)
    render :phone, :obj => phone_1
  end

end
