class Card
  attr_reader :face_up, :value

  def initialize(value)
    @face_up = false
    @value = value
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    return value if self.face_up
    ' '
  end

  def ==(arg)
    self.value == arg.value
  end

end
