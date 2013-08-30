class String

  def self.vowels
    %w(a e i o u)
  end

  def vowel?
    return self.class.vowels.include? self[0].downcase if self.length == 1
    raise "Incorrect String length, expecting length of 1, got #{self.length}"
  end

  def consonant?
    !vowel?
  end

end
