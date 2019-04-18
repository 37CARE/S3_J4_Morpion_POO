require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




#code starts executing here
m = Menu.new
b = Board.new
p1 = Player.new
p1.marker = "X".colorize(:green)
p2 = Player.new
p2.marker = "O".colorize(:red)

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
		puts player.name.colorize(:blue)
		puts "à toi de jouer?".colorize(:blue)
		move = gets.chomp.to_i

		b.valid_move?(move)
		b.open_move?(move)

		b.log_move(move, player.marker)
		player.update_moves(move)
		turn = !turn

		if player.check_win
			game_on = false
			puts ""
            puts "**YEAAHHHHHHH #{player.name}!!CHAMPION DU MONDE!!!!!!**".colorize(:pink)
            puts "                  BEAU GOSSE!!!!".colorize(:red)
            puts "
            *    *
            *         '       *       .  *   '     .           * *
                                                                        '
                *                *'          *          *        '
            .           *               |               /
                        '.         |    |      '       |   '     *
                          \*        \   \             /
                '          \     '* |    |  *        |*                *  *
                     *      `.       \   |     *     /    *      '
           .                  \      |   \          /               *
              *'  *     '      \      \   '.       |
                 -._            `                  /         *
           ' '      ``._   *                           '          .      '
            *           *\*          * .   .      *
         *  '        *    `-._                       .         _..:='        *
                      .  '      *       *    *   .       _.:--'
                   *           .     .     *         .-'         *
            .               '             . '   *           *         .
           *       ___.-=--..-._     *                '               '
                                           *       *
                         *        _.'  .'       `.        '  *             *
              *              *_.-'   .'            `.               *
                            .'                       `._             *  '
            '       '                        .       .  `.     .
                .                      *                  `
                        *        '             '                          .
              .                          *        .           *  *
                      *        .                                    '
         ".colorize(:yellow)
			b.draw
			break
		end			
		
		game_on = b.check_tie

	rescue Game_Exception => ex
		puts ex.message	
		retry
	end
end
puts "
    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼".colorize(:blue)
puts"    ███▀▀▀██┼███▀▀▀███┼███▀█▄█▀███┼██▀▀▀
    ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼█┼┼┼██┼██┼┼┼
    ██┼┼┼▄▄▄┼██▄▄▄▄▄██┼██┼┼┼▀┼┼┼██┼██▀▀▀
    ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██┼┼┼
    ███▄▄▄██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██▄▄▄".colorize(:red)
puts"    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼".colorize(:blue)
puts"    ███▀▀▀███┼▀███┼┼██▀┼██▀▀▀┼██▀▀▀▀██▄┼
    ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██┼┼┼┼██┼┼┼┼┼██┼
    ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██▀▀▀┼██▄▄▄▄▄▀▀┼
    ██┼┼┼┼┼██┼┼┼██┼┼█▀┼┼██┼┼┼┼██┼┼┼┼┼██┼
    ███▄▄▄███┼┼┼─▀█▀┼┼─┼██▄▄▄┼██┼┼┼┼┼██▄".colorize(:green)
puts"    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼".colorize(:blue)