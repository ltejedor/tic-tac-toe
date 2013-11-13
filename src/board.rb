class TicTacToeBoard
	def initialize
		@spots = [*1..9].map &:to_s
	end

	def spots
		spots = @spots
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

end