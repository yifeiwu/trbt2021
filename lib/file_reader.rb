require 'robot'

class FileReader
	def initialize(filename=nil)
	  raise ArgumentError, "file doesn't exist" unless File.file?(filename)
	  bot = Robot.new()
	  File.open(filename).each do |line|
  	  end
	end



end