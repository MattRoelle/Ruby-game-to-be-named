require_relative 'wall'

class Level

	attr_accessor :walls

	def initialize
		@walls = []
		@walls << Wall.new(400,300,50,50)
	end

	def update

	end

	def draw(window, xOffset=0, yOffset=0)
		@walls.each do |wall|
			wall.draw(window,xOffset,yOffset)
		end
	end

end
#