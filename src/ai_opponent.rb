class ComputerPlayer
	def initialize
		@computer_player = false
	end

	def play_mode
		puts "Would you like to play against a computer or a human (C or H)?"
		@answer = gets.chomp.upcase
		if @answer == "C"
			@computer_player = true
		elsif @answer == "H"
			@computer_player = false
		else
			puts "That was not a valid input"
			play_mode
		end
	end

	def play_computer?
		@computer_player
	end

end