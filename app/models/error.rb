class Error < Struct.new(:errors)

  def success?
    false
  end

end
