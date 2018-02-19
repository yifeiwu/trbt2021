class Robot

  CARD_DIR = {NORTH: [0,1], EAST: [1,0], SOUTH: [0,-1], WEST:[-1,0]}

  def initialize(x=nil,y=nil,f=nil)
  	set_xyf(x,y,f)
  end

  def place(x=nil,y=nil,f=nil)
  	set_xyf(x,y,f)
  	return
  end

  def move
    unless invalid_position
      x_hat, y_hat = CARD_DIR[@facing]
      old_xyf = get_xyf
      test_x = @position[0]+x_hat
      test_y = @position[1]+y_hat
      set_xyf(test_x,test_y,@facing)
      set_xyf(*old_xyf) if invalid_position #rollback
      return
    end
  end

  def left
  	unless invalid_position
  	  index = get_facing_index(@facing)
  	  self.facing = valid_facing[(index-1)%4]
  	  return
  	end
  end

  def right
  	unless invalid_position
  	  index = get_facing_index(@facing)
  	  self.facing = valid_facing[(index+1)%4]
  	  return
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
  	@facing = new_facing.upcase.to_sym
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
  	@position = x,y
    @facing = f
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
    %w(NORTH EAST SOUTH WEST)

  def get_facing_index(face)
  	valid_facing.find_index{|i| i == face}
  end


end
