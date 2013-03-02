require_relative 'rect'
require_relative 'routines'

class Wall

	attr_accessor :rect

	def initialize(x, y, w, h, color=0xFF0000FF)
		@x = x
		@y = y
		@w = w
		@h = h
		@color = color

		@rect = Rect.new(@x,@y,@w,@h)
	end

	def draw(window, xOffset=0, yOffset=0)
		DrawingRoutines::drawQuad(window,@x,@y,@w,@h,@color,xOffset,yOffset)
	end

end
#