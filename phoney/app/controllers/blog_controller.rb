class MyTable < Tracks::Model::SQLite
  ['title', 'body'].each do |method|
    define_method(method) {
      self[method]
    }
  end
end
class BlogController < Tracks::Controller

  def show
    render_response :post, :obj => MyTable.find(1)
  end

  def show_title
    MyTable.find(1).title
  end

end
