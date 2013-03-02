require './player'
require './level'

require 'gosu'

class GameWindow < Gosu::Window

  def initialize
    super 800, 600, false
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

  	[Gosu::KbA, Gosu::KbD, Gosu::KbW, Gosu::KbS].each do |dir|
  		if button_down?(dir)
  			input[dir] = true
  		else
  			input[dir] = false
  		end
  	end

  	#Player Movement
	  	if input[Gosu::KbA] and input[Gosu::KbW] then @player.move(-135.toRadians,@level)
	  	elsif input[Gosu::KbA] and input[Gosu::KbS] then @player.move(135.toRadians,@level)

	  	elsif input[Gosu::KbD] and input[Gosu::KbS] then @player.move(45.toRadians,@level)
	  	elsif input[Gosu::KbD] and input[Gosu::KbW] then @player.move(-45.toRadians,@level)
      else
  	  	if input[Gosu::KbW] then @player.move(270.toRadians,@level)
  	  	elsif input[Gosu::KbS] then @player.move(90.toRadians,@level)
  	  	elsif input[Gosu::KbA] then @player.move(180.toRadians,@level)
  	  	elsif input[Gosu::KbD] then @player.move(0.toRadians,@level)
        end
  	end
  end

end

window = GameWindow.new
window.show