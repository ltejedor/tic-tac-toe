require_relative "win_criteria"
require_relative "board"
require_relative "ai_opponent"

class TicTacToe
	def initialize
		@turns = 0
		@game_over = false
		@board = TicTacToeBoard.new
		@spots = @board.spots
		@criteria = WinCriteria.new(@spots)
		@computer_player = ComputerPlayer.new
	end

	def play

		@computer_player.play_mode

		@board.row_spots
		@board.create_board

		if @computer_player.play_computer? == false
			get_move
			human_play
		else
			until @game_over
				human_move
				computer_move
			end
		end

	end

	def human_play
		until @game_over
			if move_valid?
				if tie?
					puts "It was a tie. Get better at tic-tac-toe losers."
					game_over
				elsif player_turn
					x_play
					if !@criteria.x_wins
						post_play
					else
						@board.create_board
						puts "Player 1 wins, good job winner!"
						game_over
					end
				else
					o_play
					if !@criteria.o_wins
						post_play
					else
						@board.create_board
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

	#Get moves for two humans playing
	def get_move
		if player_turn
			puts "Where would you like to go Player 1?"
		else
			puts "Where would you like to go Player 2?"
		end
		@move = gets.chomp
	end

	#Check which player's turn it is
	def player_turn
		@turns % 2 == 0
	end

	#Go through the process of getting the board ready and getting the player's move
	def post_play
		@board.row_spots
		@board.create_board
		@turns = @turns + 1
		get_move
	end

	def game_over
		@game_over = true
	end

	def tie?
		@turns == 8
	end

	def move_valid?
		@spots.include? @move.to_s
	end

	def not_valid
		puts "This is not an available move, please make another selection"
	end

	def x_play
		@spots.map! { |e| e == @move.to_s ? "X" : e }
	end

	def o_play
		@spots.map! { |e| e == @move.to_s ? "O" : e }
	end

	#Ai Information-----------------------------
	def human_move
		puts "Where would you like to go Human?"
		@move = gets.chomp
		if move_valid?
			x_play
		else
			not_valid
		end
	end

	def computer_move
		if @spots.include? 5.to_s
			@move = 5
		end
		o_play
		post_alt_play
		puts "The computer chooses #{@move.to_s}."
	end

	def post_alt_play
		@board.row_spots
		@board.create_board
		@turns = @turns + 1
	end

end
