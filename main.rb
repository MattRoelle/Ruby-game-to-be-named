require_relative 'player'
require_relative 'level'

require 'gosu'

class GameWindow < Gosu::Window

  def initialize
    super 640, 480, false
    @player = Player.new
    @level = Level.new
  end
  
  def update
  	handleInput
  	@player.update()
  end
  
  def draw
  	@player.draw(self)
  	@level.draw(self)
  end

  def handleInput
  	input = {}

  	[Gosu::KbLeft, Gosu::KbRight, Gosu::KbUp, Gosu::KbDown].each do |dir|
  		if button_down?(dir)
  			input[dir] = true
  		else
  			input[dir] = false
  		end
  	end

  	#Player Movement
	  	if input[Gosu::KbLeft] and input[Gosu::KbUp] then @player.move(-1,-1,@level)
	  	elsif input[Gosu::KbLeft] and input[Gosu::KbDown] then @player.move(-1,1,@level)

	  	elsif input[Gosu::KbRight] and input[Gosu::KbDown] then @player.move(1,1,@level)
	  	elsif input[Gosu::KbRight] and input[Gosu::KbUp] then @player.move(1,-1,@level)

	  	elsif input[Gosu::KbUp] then @player.move(0,-1,@level)
	  	elsif input[Gosu::KbDown] then @player.move(0,1,@level)
	  	elsif input[Gosu::KbLeft] then @player.move(-1,0,@level)
	  	elsif input[Gosu::KbRight] then @player.move(1,0,@level)
  	end
  end

end

window = GameWindow.new
window.show