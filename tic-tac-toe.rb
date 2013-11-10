require_relative "win_criteria"

class TicTacToe
	def initialize
		@spots = [
					"1", "2", "3",
					"4", "5", "6",
					"7", "8", "9"
				 ]
		@turns = 0
		@game_over = false
		@criteria = WinCriteria.new(@spots)
	end

	def play

		row_spots
		create_board
		get_move

		while !@criteria.x_wins || !@criteria.o_wins
			require 'pry'; binding.pry
			if move_valid?
				if @criteria.x_wins
					puts "Player 1 wins, good job winner!"
				elsif @criteria.o_wins
					puts "Player 2 wins, good job winner!"
				elsif @turns == 8
					puts "It was a tie. Get better at tic-tac-toe losers."
					game_over
				elsif player_turn?
					x_play
					post_play
				else
					o_play
					post_play
				end
			else
				not_valid
				get_move
			end
		end
	end


	def post_play
		row_spots
		create_board
		@turns = @turns + 1
		get_move
	end

	def game_over
		@game_over = true
	end

	def row_spots
		@spots.each_slice(3).to_a
	end

	def create_board
		puts "\n--------------"
		for index in 0..2
			puts row_spots[index].join("  |  ")
			puts "--------------"
		end
	end

	def get_move
		if player_turn?
			puts "Where would you like to go Player 1?"
		else
			puts "Where would you like to go Player 2?"
		end
		@move = gets.chomp
	end

	def move_valid?
		@spots.include? @move.to_s
	end

	def player_turn?
		(@turns == 0) || (@turns == 2) || (@turns == 4) || (@turns == 6) || (@turns == 8)
	end

	def x_play
		@spots.map! { |e| e == @move.to_s ? "X" : e }
	end

	def o_play
		@spots.map! { |e| e == @move.to_s ? "O" : e }
	end

	def not_valid
		puts "This is not an available move, please make another selection"
	end


end


TicTacToe.new.play
