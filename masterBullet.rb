require './rect'
require './routines'
require './player'
require './level'

class Bullet

  attr_accessor :x
  attr_accessor :y
  attr_accessor :rect

  def initialize(x,y,dx,dy)
    @x = x
    @y = y
    @dx = dx
    @dy = dy
    @rect = Rect.new(@x,@y,8,8)
    @dead = false
  end

  def draw(window)
    DrawingRoutines::drawQuad(@x,@y,@w,@h,0xFFFFFFFF)
  end

  def update(player,level)
    @x += dx
    @y += dy

    @rect = Rect.new(@x,@y,@w,@h)

    level.walls.each do |wall|
      if wall.rect.collideWith?(@rect)
        @dead = true
      end
    end

  end

  def dead?
    @dead
  end

end