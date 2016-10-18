class Robot

  def initialize(x=nil,y=nil,f=nil)
  	set_xyf(x,y,f)
  end

  def move
    unless invalid_position
      case @facing
      when "NORTH"
        x_hat = 0
        y_hat = 1
      when "EAST"
      	x_hat = 1
      	y_hat = 0
      when "SOUTH"
      	x_hat = 0
      	y_hat = -1
      when "WEST"
      	x_hat = -1
      	y_hat = 0
      end
      old_xyf = get_xyf
      test_x = @position[0]+x_hat
      test_y = @position[1]+y_hat
      set_xyf(test_x,test_y,@facing)
      set_xyf(*old_xyf) if invalid_position #rollback
    end

  end

  def left
  	unless invalid_position
  	  index = get_facing_index(@facing)
  	  self.facing = valid_facing[index-1]
  	end
  end

  def right
  	unless invalid_position
  	  index = get_facing_index(@facing)
  	  self.facing = valid_facing[index+1]
  	end
  end


  def report
    unless invalid_position
      get_xyf
    end
  end



  private


  def position=(new_position)
    @position = new_position
  end

  def facing=(new_facing)
  	return unless new_facing.is_a? String
  	@facing = new_facing.upcase
  end

  def invalid_position
    return true if blank_fields
    return true if invalid_bounds
    return true if invalid_facings
    false
  end

  def get_xyf
    [@position[0], @position[1], @facing]
  end

  def set_xyf(x,y,f)
  	self.position = x,y
    self.facing = f
  end

  def blank_fields
    get_xyf.any?{|field| field.nil?} || get_xyf.any?{|field| field == ''}
  end

  def invalid_bounds
    return true unless @position.all?{|field| field.is_a? Integer}
    return true unless @position.all?{|field| (0..4) === field}
    false
  end

  def invalid_facings
    case @facing
    when *valid_facing
      return false
    else
      return true
    end
  end

  def valid_facing
  	["NORTH", "EAST", "SOUTH", "WEST"]
  end

  def get_facing_index(face)
  	valid_facing.find_index{|i| i == face}
  end


end
