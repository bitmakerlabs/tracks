class PhoneyController < Tracks::Controller

  # 'real' actions we will be keeping

  def index
    render :index, :phones => FileModel.all
  end

  def show
    render_response :phone, :obj => FileModel.find(params['id']), :ua => request.user_agent
  end

  def new_phone
    phone = FileModel.create( {'phone' => 'cellular', 'inventor' => 'motorola'} )
    render :phone, :obj => phone
  end

  def update
    return "bad request" unless env['REQUEST_METHOD'].downcase == 'post'
    phone = FileModel.find(1) # hardcoded for now
    phone.update({'inventor'=>'kids'})
    render :phone, :obj => FileModel.find(1)
  end

  # actions used when developing, but won't be kept

  def by_bell
    render :index, :phones => FileModel.find_all_by_inventor('Bell')
  end

end
