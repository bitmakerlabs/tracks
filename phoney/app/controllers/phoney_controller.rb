class PhoneyController < Tracks::Controller

  # 'real' actions we will be keeping

  def index
    render :index, :phones => FileModel.all
  end

  def new_phone
    phone = FileModel.create( {'phone' => 'cellular', 'inventor' => 'motorola'} )
    render :phone, :obj => phone
  end

  # actions used when developing, but won't be kept

  def a_phone
    render :a_phone, :noun => 'battery'
  end

  def phone_1
    phone_1 = FileModel.find(1)
    render :phone, :obj => phone_1
  end

end
