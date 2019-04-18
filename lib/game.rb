require 'bundler'

#Définition de la classe tableau 
class Board < Object

	attr_accessor :board_hash, :move_counter

	def initialize
		@board_hash = {}
		clear
		@move_counter = 0
	end

    # Lorsque lla partie débute le tableau affiché est le suivant mais le code aurait pu etre
    # egalement @board_hash = [0,1,2,3 etc] la fonction 9.time fait exactement la meme chose en definisant le tableau de hash.
	def clear
        9.times{ |i| @board_hash[i+1] = "#{i+1}"}
        
	end
    
    # Affichage du tableau 
	def draw
		puts ""
		puts "   #{@board_hash[1]} | #{@board_hash[2]} | #{@board_hash[3]} "
		puts "  -----------"
		puts "   #{@board_hash[4]} | #{@board_hash[5]} | #{@board_hash[6]} "
		puts "  -----------"
		puts "   #{@board_hash[7]} | #{@board_hash[8]} | #{@board_hash[9]} "
		puts ""
	end

    # DEFINITION DES LIMITES DU JEU 
    # LE COUP DOIT ETRE UN CHIFFRE ENTRE 1 ET 10 POUR ETRE VALIDE 
	def valid_move?(move)
		raise Invalid_Entry unless move > 0 && move < 10
	end

	def open_move?(move)
		raise Space_Taken unless @board_hash[move].to_i > 0
	end

	#Le coup joué est un entier et le joueur est "X" ou "O"
	def log_move(move, mark)
		@move_counter += 1
		@board_hash[move] = mark
	end

	def check_tie
		if @move_counter == 9
			draw
			puts "LA PARTIE EST FINIE".colorize(:red)
			return false
		else
			return true
		end
	end
end

class Game_Exception < Exception
	def message
		"GENERAL GAME EXCEPTION"
	end
end

class Invalid_Entry < Game_Exception
	def message 
		"\nPOSITION NON VALIDE".colorize(:red)
	end
end

class Space_Taken < Game_Exception
	def message 
		"\nCE COUP A DEJÀ ÉTÉ JOUÉ".colorize(:red)
	end
end

