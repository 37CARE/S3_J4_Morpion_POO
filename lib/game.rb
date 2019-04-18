require 'bundler'
require 'colorize'

class Board < Object

	attr_accessor :board_hash, :move_counter

	def initialize
		@board_hash = {}
		clear
		@move_counter = 0
	end

	def clear
        9.times{ |i| @board_hash[i+1] = "#{i+1}"}
        
	end
	
	def draw
		puts ""
		puts "   #{@board_hash[1]} | #{@board_hash[2]} | #{@board_hash[3]} "
		puts "  -----------"
		puts "   #{@board_hash[4]} | #{@board_hash[5]} | #{@board_hash[6]} "
		puts "  -----------"
		puts "   #{@board_hash[7]} | #{@board_hash[8]} | #{@board_hash[9]} "
		puts ""
	end

	def valid_move?(move)
		raise Invalid_Entry unless move > 0 && move < 10
	end

	#move should be an integer 0 < i < 10
	def open_move?(move)
		raise Space_Taken unless @board_hash[move].to_i > 0
	end

	#move is an integer 1-9 and player is "X" or "Y"
	def log_move(move, mark)
		@move_counter += 1
		@board_hash[move] = mark
	end

	def check_tie
		if @move_counter == 9
			draw
			puts "THIS GAME ENDED IN A TIE"
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
		"\nNOT A VALID POSITION."
	end
end

class Space_Taken < Game_Exception
	def message 
		"\nTHIS SPACE IS ALREADY TAKEN."
	end
end

