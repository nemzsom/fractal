module Drawers
  
  class Starter
    
    def initialize(window)
      @window = window
      @next = self
    end
    
    def draw ; end
    
    def button_down(id)
      if id == Gosu::MsLeft
        @next = Segment.new(@window, [@window.mouse_x, @window.mouse_y])
      end
    end
    
    def update
      @next
    end
  
  end

  class Segment
    
    def initialize(window, p1)
      @window = window
      @p1 = p1
      @start = p1
      @next = self
    end
    
    def draw
      p2 = [@window.mouse_x, @window.mouse_y]
      @window.draw_white_line [@p1, p2]
    end
    
    def button_down(id)
      case id
      when Gosu::MsLeft
        new_segment([@window.mouse_x, @window.mouse_y])
      when Gosu::MsRight
        new_segment(@start)
        @next = Fractal.new(@window)
      end
    end
    
    def new_segment(p)
      @window.segments << [@p1, p]
      @p1 = p
    end
    
    def update
      @next
    end
  end
  
  class Fractal
  
    def initialize(window)
      @window = window
      @poligon = window.segments.clone
      @iter = 0
    end
    
    def draw
    end
    
    def button_down(id)
    end
    
    def update
      if @iter < 1000
        new_poligon = []
        @poligon.inject(nil) do |p1, segment|
          p2  = mid_point(segment)
          if p1
            new_segment = [p1, p2]
            @window.segments << new_segment
            new_poligon << new_segment
          end
          p2
        end
        new_segment = [new_poligon.last[1], new_poligon.first[0]]
        new_poligon << new_segment
        @window.segments << new_segment
        @poligon = new_poligon
        @iter += 1
      end      
      self
    end
    
    def mid_point(segment)
      p1 = segment[0]
      p2 = segment[1]
      mid_x = (p1[0] + p2[0]) / 2
      mid_y = (p1[1] + p2[1]) / 2
      [mid_x, mid_y]
    end
    
  end

end