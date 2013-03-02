#gosu drawing routines
require 'gosu'

module DrawingRoutines

	def DrawingRoutines.drawQuad(window, x, y, w, h, color, xOffset=0, yOffset=0)
		window.draw_quad((x+xOffset),(y+yOffset),color,
						(x+xOffset)+w,(y+yOffset),color,
						(x+xOffset),(y+yOffset)+h,color,
						(x+xOffset)+w,(y+yOffset)+h,color)
	end

end

class Numeric

  def toRadians
    return (self*Math::PI)/180
  end

end