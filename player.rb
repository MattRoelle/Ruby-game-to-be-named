require './rect'
require './routines.rb'

require 'gosu'

class Player

	attr_accessor :x
	attr_accessor :y

	def initialize
		@x = 100
		@y = 100
		@w = 32
		@h = 32
		@color = 0xFFFF0000
		@rect = Rect.new(@x,@y,@w,@h)
		@speed = 5
	end

	def draw(window, xOffset=0, yOffset=0)
		DrawingRoutines::drawQuad(window,@x,@y,@w,@h,@color,xOffset,yOffset)
	end

	def update
		@rect = Rect.new(@x,@y,@w,@h)
	end

	def warp(x, y)
		@x = x
		@y = y
	end

	def move(angle, level)
		oldX = @x
		oldY = @y

		@x += Math.cos(angle)*3
		@y += Math.sin(angle)*3

		@rect = Rect.new(@x,@y,@w,@h)

		level.walls.each do |wall|
			if wall.rect.collideWith?(@rect)
				@x = oldX
				@y = oldY
				@rect = Rect.new(@x,@y,@w,@h)
			end
		end
	end

end
#