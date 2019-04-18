require 'bundler'
require 'colorize'

class Menu < Object

	attr_accessor :p1, :p2

	def initialize
		@p1 = nil
		@p2 = nil
	end

	def greeting
		puts ""
		puts "***********************"
		puts "Welcome to Tic-Tac-Toe!"
	end

	def p1_name
		puts "Player 1 name?"
		@p1 = gets.chomp
	end

	def p2_name
		puts "Player 2 name?"
		@p2 = gets.chomp
	end

	def intro
		greeting
		p1_name
		p2_name
	end
end


class Player < Object

	attr_accessor :moves_hash, :name, :marker

	def initialize
		@name = nil
		@marker = nil
		@moves_hash = {}
		clear_moves	
	end

	def clear_moves
		9.times{ |i| @moves_hash[i+1] = false}
	end

	def update_moves (move)
		@moves_hash[move] = true
	end

	def check_win
		return check_horizontal || check_vertical || check_diagonal
	end

	def check_horizontal
		wint = @moves_hash[1] && @moves_hash[2] && @moves_hash[3]
		winm = @moves_hash[4] && @moves_hash[5] && @moves_hash[6]
		winb = @moves_hash[7] && @moves_hash[8] && @moves_hash[9]
		win = wint || winm || winb
		return win
	end

	def check_vertical
		winl = @moves_hash[1] && @moves_hash[4] && @moves_hash[7]
		winm = @moves_hash[2] && @moves_hash[5] && @moves_hash[8]
		winr = @moves_hash[3] && @moves_hash[6] && @moves_hash[9]
		win = winl || winm || winr
		return win
	end

	def check_diagonal
		wint = @moves_hash[1] && @moves_hash[5] && @moves_hash[9]
		winb = @moves_hash[7] && @moves_hash[5] && @moves_hash[3]
		win = wint || winb
		return win
	end
end

