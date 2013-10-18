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
    end
    
    def draw
      
    end
    
    def button_down(id)

    end
    
    def new_segment(p)
      
    end
    
    def update
      self
    end
    
  end

end