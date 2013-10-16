require 'gosu'

$res_x = 1650
$res_y = 900

class MainWindow < Gosu::Window

  def initialize
    super $res_x, $res_y, false
  end
  
  def update
    
  end

  def draw
    white = Gosu::Color::WHITE
    draw_line(0, 0, white, $res_x, $res_y, white)
    draw_line(0, $res_y, white, $res_x, 0, white)
  end
  
  def needs_cursor?
    true
  end
  
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

MainWindow.new.show