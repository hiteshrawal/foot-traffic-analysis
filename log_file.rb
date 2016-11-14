class LogFile
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def get_lines
    lines = []
    read_file.each_line{|line| lines << line.chomp }
    lines
  end

  private

  def read_file
    @_read_file ||= File.open(file).read
  end  
end