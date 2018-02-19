require 'robot'

class FileReader
  def initialize(filename = nil)
    raise ArgumentError, "file doesn't exist" unless File.file?(filename)
    @bot = Robot.new
    @filename = filename
  end

  def process_input
    File.open(@filename).each do |line|
      print parse_line_command(line)
    end
  end

  private

  def parse_line_command(line = nil)
    case line
    when /PLACE (.+)/ # first placement
      x, y, f = Regexp.last_match(1).split(',')
      @bot.place(x.to_i, y.to_i, f.to_s)
    when /MOVE/
      @bot.move
    when /LEFT/
      @bot.left
    when /RIGHT/
      @bot.right
    when /REPORT/
      a, b, c = @bot.report
      report_string = "#{a}, #{b}, #{c}\n"
      report_string
    end
  end
end
