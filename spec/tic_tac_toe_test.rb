require_relative '../src/win_criteria'
require 'minitest/autorun'

class TicTacToeTest < Minitest::Unit::TestCase

	def test_winning_criteria_are_false_if_no_one_is_winning
		spots = ('1'..'9').to_a
		assert !WinCriteria.new(spots).x_wins
		assert !WinCriteria.new(spots).o_wins
	end

		def test_winning_criteria_are_true_if_x_is_winning
		spots = ('1'..'9').to_a
		spots[0] = 'X'
		spots[1] = 'X'
		spots[2] = 'X'
		assert WinCriteria.new(spots).x_wins
		assert !WinCriteria.new(spots).o_wins
	end

		def test_winning_criteria_are_true_if_o_is_winning
		spots = ('1'..'9').to_a
		spots[0] = 'O'
		spots[1] = 'O'
		spots[2] = 'O'
		assert WinCriteria.new(spots).o_wins
		assert !WinCriteria.new(spots).x_wins
	end
end