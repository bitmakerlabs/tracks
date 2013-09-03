class Object
  def self.const_missing(c)
    return nil if @in_const_missing
    @in_const_missing = true
    require Tracks.to_underscore(c.to_s)
    Object.const_get(c)
    @in_const_missing = true
  end
end
