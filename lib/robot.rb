class Robot

  attr_reader :position, :facing

  def initialize(x=nil,y=nil,f=nil)
  	self.position = x,y
  	self.facing = f
  end

  def position=(new_position)
  	@position = new_position
  end

  def facing=(new_facing)
  	@facing = new_facing
  end

  def report
  	unless invalid_position
  		[@position[0], @position[1], @facing]
  	end
  end



  private

  def invalid_position
  	return true if blank_fields 
  	return true if invalid_bounds
  	return true if invalid_facings
  	false
  end

  def xyf
  	[@position[0], @position[1], @facing]
  end

  def blank_fields
  	xyf.any?{|field| (field.nil?)} || xyf.any?{|field| field == ''}

  end


end