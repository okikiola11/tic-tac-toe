module Util
  def input_to_index(user_input)
    user_input.to_i - 1
  end
end

class Game
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  attr_reader :board

  def display_board
    display = [
    [" #{@board[0]} | #{@board[1]} | #{@board[2]} "],
    ['----------- '],
    [" #{@board[3]} | #{@board[4]} | #{@board[5]} "],
    ['----------- '],
    [" #{@board[6]} | #{@board[7]} | #{@board[8]} "]
    ]
  end

  def valid_move?(index)
    return true if index.between?(0, 8) && @board[index] == ' '
  end

  def turn_count(board)
    counter = 0
    @board.each do |spaces|
      counter += 1 if spaces.include?('X') || spaces.include?('O')
    end
    counter
  end

  def current_player
    turn_count(@board).even? ? 'X' : 'O'
  end

  def move(index, player)
    @board[index] = player
  end

  def won?
    if (@board[0] == @board[1] && @board[1] == @board[2]) && !@board.values_at(0, 1, 2).include?(' ')
      true
    elsif (@board[3] == @board[4] && @board[4] == @board[5]) && !@board.values_at(3, 4, 5).include?(' ')
      true
    elsif (@board[6] == @board[7] && @board[7] == @board[8]) && !@board.values_at(6, 7, 8).include?(' ')
      true
    elsif (@board[0] == @board[3] && @board[3] == @board[6]) && !@board.values_at(0, 3, 6).include?(' ')
      true
    elsif (@board[1] == @board[4] && @board[4] == @board[7]) && !@board.values_at(1, 4, 7).include?(' ')
      true
    elsif (@board[2] == @board[5] && @board[5] == @board[8]) && !@board.values_at(2, 5, 8).include?(' ')
      true
    elsif (@board[0] == @board[4] && @board[4] == @board[8]) && !@board.values_at(0, 4, 8).include?(' ')
      true
    elsif (@board[2] == @board[4] && @board[4] == @board[6]) && !@board.values_at(2, 4, 6).include?(' ')
      true
    end
  end

  def empty_board
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
end
