class Rect

	attr_accessor :x
	attr_accessor :y
	attr_accessor :w
	attr_accessor :h

	attr_accessor :left
	attr_accessor :right
	attr_accessor :top
	attr_accessor :bottom

	def initialize(x,y,w,h)
		@x = x
		@y = y
		@w = w
		@h = h
		#implied values
		@left = @x
		@top = @y
		@right = @x + @w
		@bottom = @top+@h
	end

	def collideWith?(r2)
		if (@left > r2.right)
			return false
		elsif (@right < r2.left)
			return false
		elsif (@top > r2.bottom)
			return false
		elsif (@bottom < r2.top)
			return false
		end
		return true
	end

end