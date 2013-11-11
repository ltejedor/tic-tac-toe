require_relative "win_criteria"

class TicTacToe
	def initialize
		@spots = [*1..9].map &:to_s
		@turns = 0
		@game_over = false
		@criteria = WinCriteria.new(@spots)
	end

	def play

		row_spots
		create_board
		get_move

		until @game_over
			if move_valid?
				if @criteria.x_wins
					puts "Player 1 wins, good job winner!"
					game_over
				elsif @criteria.o_wins
					puts "Player 2 wins, good job winner!"
					game_over
				elsif @turns == 8
					puts "It was a tie. Get better at tic-tac-toe losers."
					game_over
				elsif player_turn?
					x_play
					if !@criteria.x_wins
						post_play
					else
						create_board
						puts "Player 1 wins, good job winner!"
						game_over
					end
				else
					o_play
					if !@criteria.o_wins
						post_play
					else
						create_board
						puts "Player 2 wins, good job winner!"
						game_over
					end
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
