require_relative '../lib/players.rb'
require_relative '../lib/board.rb'

class Game
  def initialize(player1 = 'player1', player2 = 'player2')
    @board = Board.new
    @playerz = Players.new
    @playerz.player(player1, player2)
    @win_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]
  end

  attr_reader :board, :playerz

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def valid_move?(index)
    return true if index.between?(0, 8) && @board.board_cells[index] == ' '
  end

  def turn_count(_board)
    counter = 0
    @board.board_cells.each do |spaces|
      counter += 1 if spaces.include?('X') || spaces.include?('O')
    end
    counter
  end

  def current_player
    turn_count(@board.board_cells).even? ? 'X' : 'O'
  end

  def move(index, player)
    @board.board_cells[index] = player
  end

  def check_players_turn
    if current_player == 'X'
      "#{@playerz.player1}: It's your turn to play"
    elsif current_player == 'O'
      "#{@playerz.player2}: It's your turn to play"
    end
  end

  def won?
    win = false
    @win_combinations.each do |combination|
      place1 = @board.board_cells[combination[0]]
      place2 = @board.board_cells[combination[1]]
      place3 = @board.board_cells[combination[2]]
      win = place1 if place1 == place2 && place2 == place3 && place1 != ' '
    end
    win
  end

  def check_win
    if won?
      check_winner
    elsif full_board?
      'It\'s a Draw!'
    end
  end

  def check_winner
    if current_player == 'O'
      "#{playerz.player1} won the game!"
    else
      "#{playerz.player2} won the game!"
    end
  end

  def full_board?
    true unless @board.board_cells.include?(' ')
  end

  def game_over?
    true if full_board? || won?
  end

  def empty_board
    @board.board_cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
end
