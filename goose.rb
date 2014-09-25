require 'rrobots'
#events['robot_scanned']

class Goose
  include Robot
  @pointing_south = 270
  @pointing_east = 0
  @pointing_north = 90
  @pointing_west = 180

  def tick events
    fire 0.5
    @go = accelerate 1
    @go

    point_gun_left_of_tank

    turn_left_at_walls if time > 50
  end

  def point_gun_left_of_tank
    if gun_heading == heading + 90 || x <= 400
      turn_gun 0
    else
      turn_gun 3
    end
  end

  def turn_left_at_walls
    if at_west_wall
      turn_tank @pointing_south
    elsif at_south_wall
      turn_tank @pointing_east
    elsif at_east_wall
      turn_tank @pointing_north
    elsif at_north_wall
      turn_tank @pointing_west
    end
  end

  def turn_tank(direction)
    if heading == direction
      @go
    else
      decelerate_and_turn
    end
  end

  def decelerate_and_turn
    accelerate 0
    turn 5
  end

  def at_west_wall
    return true if x <= 60
    return false
  end

  def at_south_wall
    return true if y >= 1540
    return false
  end

  def at_east_wall
    return true if x >= 1540
    return false
  end

  def at_north_wall
    return true if y <= 60
    return false
  end
end
