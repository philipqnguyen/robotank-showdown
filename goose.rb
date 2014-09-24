require 'rrobots'

class Goose
  include Robot

  def tick events
    fire 1
    go = accelerate 5
    go

    if gun_heading == heading + 90
      turn_gun 0
    elsif x <= 800
      turn_gun 0
    else
      turn_gun 3
    end

    if x <= 60
      accelerate 0
      turn 1
      if heading == 270
        go
      end
    elsif y >= 1540
      accelerate 0
      turn 1
      if heading == 0
        go
      end
    elsif x >= 1540
      accelerate 0
      turn 1
      if heading == 90
        go
      end
    elsif y <= 60
      accelerate 0
      turn 1
      if heading == 90
        go
      end
    end
  end
end
