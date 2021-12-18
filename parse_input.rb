module ParseInput
  def data(method = nil)
    File.open(@path) do |file|
      return file.readlines.map(&:chomp).map(&:chars)
    end
  end
end