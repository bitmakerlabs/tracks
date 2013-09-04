class MyTable < Tracks::Model::SQLite

  def method_missing(method, *args)
    # todo: figure out why define_method appears to not be working here. if you call .title twice, it seems does the puts below twice
    method_name = method.to_s
    return false unless ['title', 'body'].include? method_name
    define_method(method) { @hash[method_name] }
    puts "SHOULD ONLY SEE THIS ONCE"
    @hash[method_name] # should be able to just do self.send method
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
