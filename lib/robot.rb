# frozen_string_literal: true

# A toy robot
class Robot
  CARDINAL_DIRECTIONS = { NORTH: [0, 1], EAST: [1, 0], SOUTH: [0, -1], WEST: [-1, 0] }.freeze
  BOARD_BOUNDARY = (0..5).freeze

  def initialize; end

  def place(x = nil, y = nil, f = nil)
    set_xyf(x, y, f)
  end

  def move
    return if invalid_position?(*@position, @facing)

    x_dir, y_dir = CARDINAL_DIRECTIONS[@facing.to_sym]
    test_x = @position[0] + x_dir
    test_y = @position[1] + y_dir
    return if invalid_position?(test_x, test_y, @facing)

    set_xyf(test_x, test_y, @facing)
  end

  def left
    return if invalid_position?(*@position, @facing)

    index = get_facing_index(@facing)
    @facing = valid_facings[(index - 1) % 4]
  end

  def right
    return if invalid_position?(*@position, @facing)

    index = get_facing_index(@facing)
    @facing = valid_facings[(index + 1) % 4]
  end

  def report
    xyf unless invalid_position?(*@position, @facing)
  end

  private

  attr_writer :position, :facing

  def invalid_position?(x, y, f)
    return true if invalid_bounds?(x, y)
    return true if invalid_facings?(f)

    false
  end

  def xyf
    [@position[0], @position[1], @facing]
  end

  def set_xyf(x, y, f)
    @position = x, y
    @facing = f&.upcase
  end

  def invalid_bounds?(x, y)
    return true unless [x, y].all? { |field| field.is_a?(Integer) }
    return true unless [x, y].all? { |field| BOARD_BOUNDARY === field }

    false
  end

  def invalid_facings?(f)
    valid_facings.none? f
  end

  def valid_facings
    CARDINAL_DIRECTIONS.keys.map(&:to_s)
  end

  def get_facing_index(face)
    valid_facings.find_index { |i| i == face }
  end
end
