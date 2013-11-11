class WinCriteria

	def initialize spots
		@spots = spots
	end

	def x_wins
		x_row_1 || x_row_2 || x_row_3 ||
		x_column_1 || x_column_2 || x_column_3 ||
		x_diagnol_1 || x_diagnol_2
	end

	def o_wins
		o_row_1 || o_row_2 || o_row_3 ||
		o_column_1 || o_column_2 || o_column_3 ||
		o_diagnol_1 || o_diagnol_2
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



