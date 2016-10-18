class Robot

  attr_reader :position, :facing

  def initialize(x=nil,y=nil,f=nil)
  	self.position = x,y
  	self.facing = f
  end

  def move
  end

  def left
  end

  def right
  end
  

  def report
  	unless invalid_position
  		[@position[0], @position[1], @facing]
  	end
  end



  private


  def position=(new_position)
  	@position = new_position
  end

  def facing=(new_facing)
  	@facing = new_facing
  end

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
  	xyf.any?{|field| field.nil?} || xyf.any?{|field| field == ''}
  end

  def invalid_bounds
  	return true unless @position.all?{|field| field.is_a? Integer}
  	return true unless @position.all?{|field| (0..4) === field}
  	false
  end

  def invalid_facings
  	valid_facing = ["NORTH", "EAST", "SOUTH", "WEST"]
  	valid_facing += valid_facing.map { |face| face.downcase }
  	case @facing
  		when *valid_facing
  			return false
  		else
  			return true
	end
  end


end