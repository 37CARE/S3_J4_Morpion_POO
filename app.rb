require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




#LE CODE COMMENCE SON EXECUTION ICI ET APPEL TOUTES LES CLASS
m = Menu.new
b = Board.new
#ON APPEL LES JOUEURS ET ON LEUR ATTRIBU CHACUN UN MARQUEUR
p1 = Player.new
p1.marker = "X".colorize(:green)
p2 = Player.new
p2.marker = "O".colorize(:red)

#ON LANCE L'INTRO DU JEU ET ON APPEL LA METHODE QUI DEMANDE LE NOM 
m.intro
p1.name = m.p1.capitalize
p2.name = m.p2.capitalize

#ON POSE QUE LES TOURS S'ALTERNENT PENDANT TOUTE LA PARTIE ET ON INITIALISE LE COMPTEUR DE COUPS
turn = true
game_on = true
num_moves = 0

#LA PARTIE COMMENCE 
while game_on
	begin

		move = nil

		if turn
			player = p1
		else
			player = p2
        end
        
        #ON APPEL LES FONCTIONS SUR LE TABLEAU DESSINE SI LE COUP EST VALIDE ET OUVRE UN NOUVEAU COUP
        #LORSQUE LE COUP EST JOUÉ ENREGISTRE LE COUP ET POSE UN MARQUEUR

		b.draw
		puts player.name + "".colorize(:geen)
		puts "à toi de jouer?".colorize(:blue)
		move = gets.chomp.to_i

		b.valid_move?(move)
		b.open_move?(move)

		b.log_move(move, player.marker)
		player.update_moves(move)
        turn = !turn #REVERSE DE TURN POUR CHANGER DE JOUEUR
        
        #VÉRIFIE SI LES COUPS DU JOUEUR ENTRAINENT UNE VICTOIRE 
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