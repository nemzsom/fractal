require 'gosu'
require './drawers'

$res_x = 1650
$res_y = 900

class MainWindow < Gosu::Window

  attr_reader :segments

  def initialize
    super $res_x, $res_y, false
    @segments = []
    @drawer = Drawers::Starter.new(self)
  end
  
  def update
    @drawer = @drawer.update
  end

  def draw
    @segments.each { | segment | draw_white_line segment }
    @drawer.draw
  end
  
  def draw_white_line(segment)
    draw_line(segment[0][0], segment[0][1], Gosu::Color::WHITE, segment[1][0], segment[1][1], Gosu::Color::WHITE)
  end
  
  def needs_cursor?
    true
  end
  
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
    @drawer.button_down(id)
  end
end

MainWindow.new.show