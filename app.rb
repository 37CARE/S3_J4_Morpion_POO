require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




#code starts executing here
m = Menu.new
b = Board.new
p1 = Player.new
p1.marker = "X"
p2 = Player.new
p2.marker = "O"

m.intro
p1.name = m.p1.capitalize
p2.name = m.p2.capitalize

turn = true
game_on = true
num_moves = 0

while game_on
	begin

		move = nil

		if turn
			player = p1
		else
			player = p2
		end

		b.draw
		puts player.name + " you're up!"
		puts "What's your move?"
		move = gets.chomp.to_i

		b.valid_move?(move)
		b.open_move?(move)

		b.log_move(move, player.marker)
		player.update_moves(move)
		turn = !turn

		if player.check_win
			game_on = false
			puts ""
			puts "**Congrats #{player.name}!! You win!!**"
			b.draw
			break
		end			
		
		game_on = b.check_tie

	rescue Game_Exception => ex
		puts ex.message	
		retry
	end
end
puts "**** GAME OVER ****\n"