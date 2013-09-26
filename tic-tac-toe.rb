class TicTacToe
	def initialize
		@spots = [
					"1", "2", "3",
					"4", "5", "6",
					"7", "8", "9"
				 ]
		@turns = 0
		@game_over = false
	end

	def play

		row_spots
		create_board
		get_move

		while @game_over == false
			if move_valid?
				if x_wins
					puts "Player 1 wins, good job winner!"
					game_over
				elsif o_wins
					puts "Player 2 wins, good job winner!"
					game_over
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
		@spots.include? "#{@move}"
	end

	def player_turn?
		(@turns == 0) || (@turns == 2) || (@turns == 4) || (@turns == 6) || (@turns == 8)
	end

	def x_play
		@spots.map! { |e| e == "#{@move}" ? "X" : e }
	end

	def o_play
		@spots.map! { |e| e == "#{@move}" ? "O" : e }
	end

	def not_valid
		puts "This is not an available move, please make another selection"
	end

	def x_wins
		x_row_1 || x_row_2 || x_row_3 || x_column_1 || x_column_2 || x_column_3 || x_diagnol_1 || x_diagnol_2
	end

	def o_wins
		o_row_1 || o_row_2 || o_row_3 || o_column_1 || o_column_2 || o_column_3 || o_diagnol_1 || o_diagnol_2
	end

	def x_row_1
		(@spots[0] == "X") && (@spots[1] == "X") && (@spots[2] == "X")
	end

	def x_row_2
		(@spots[3] == "X") && (@spots[4] == "X") && (@spots[5] == "X")
	end

	def x_row_3
		(@spots[6] == "X") && (@spots[7] == "X") && (@spots[8] == "X")
	end

	def x_column_1
		(@spots[0] == "X") && (@spots[3] == "X") && (@spots[6] == "X")
	end

	def x_column_2
		(@spots[1] == "X") && (@spots[4] == "X") && (@spots[7] == "X")
	end

	def x_column_3
		(@spots[2] == "X") && (@spots[5] == "X") && (@spots[8] == "X")
	end

	def x_diagnol_1
		(@spots[0] == "X") && (@spots[4] == "X") && (@spots[8] == "X")
	end

	def x_diagnol_2
		(@spots[2] == "X") && (@spots[4] == "X") && (@spots[6] == "X")
	end

	def o_row_1
		(@spots[0] == "O") && (@spots[1] == "O") && (@spots[2] == "O")
	end

	def o_row_2
		(@spots[3] == "O") && (@spots[4] == "O") && (@spots[5] == "O")
	end

	def o_row_3
		(@spots[6] == "O") && (@spots[7] == "O") && (@spots[8] == "O")
	end

	def o_column_1
		(@spots[0] == "O") && (@spots[3] == "O") && (@spots[6] == "O")
	end

	def o_column_2
		(@spots[1] == "O") && (@spots[4] == "O") && (@spots[7] == "O")
	end

	def o_column_3
		(@spots[2] == "O") && (@spots[5] == "O") && (@spots[8] == "O")
	end

	def o_diagnol_1
		(@spots[0] == "O") && (@spots[4] == "O") && (@spots[8] == "O")
	end

	def o_diagnol_2
		(@spots[2] == "O") && (@spots[4] == "O") && (@spots[6] == "O")
	end


end

TicTacToe.new.play
