#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/AbcSize
class Game
  def initialize
    @player1 = 'X'
    @player2 = 'O'
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
  def welcome
    puts 'Welcome to Tic Tac Toe'
    puts 'Please Enter your name (Player 1): '
    player1 = gets.strip.upcase
    puts 'Please Enter your name (Player 2): '
    player2 = gets.strip.upcase
    puts "#{player1} is 'X' (player1) and #{player2} is 'O' (player2)"
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(board, index, player)
    board[index] = player
  end
  def valid_move?(board, index)
    return true if index.between?(0, 8) && board[index] == ' '
  end
  def turn_count(board)
    counter = 0
    board.each do |spaces|
      counter += 1 if spaces.include?(@player1) || spaces.include?(@player2)
    end
    counter
  end
  def current_player
    turn_count(@board).even? ? @player1 : @player2
  end
  def user_input
    game_over = false
    display_board
    until game_over == true
      puts 'Select a number between 1-9'
      input = input_to_index(gets.chomp)
      if !valid_move?(@board, input)
        puts 'Invalid move, number already taken or out of range'
      else
        move(@board, input, current_player)
        if won?(@board, @player1)
          display_board
          puts "#{@player1} won the game!"
          return game_over = true
        elsif !@board.include?(' ')
          display_board
          puts 'It\'s a Draw!'
          return game_over = true
        end
        if won?(@board, @player2)
          display_board
          puts "#{@player2} won the game!"
          return game_over = true
        elsif !@board.include?(' ')
          display_board
          puts 'It\'s a Draw!'
          return game_over = true
        end
      end
      display_board
    end
  end
  def won?(board, player)
    if (board[0] == board[1] && board[1] == board[2]) && board.values_at(0, 1, 2).include?(player)
      true
    elsif (board[3] == board[4] && board[4] == board[5]) && board.values_at(3, 4, 5).include?(player)
      true
    elsif (board[6] == board[7] && board[7] == board[8]) && board.values_at(6, 7, 8).include?(player)
      true
    elsif (board[0] == board[3] && board[3] == board[6]) && board.values_at(0, 3, 6).include?(player)
      true
    elsif (board[1] == board[4] && board[4] == board[7]) && board.values_at(1, 4, 7).include?(player)
      true
    elsif (board[2] == board[5] && board[5] == board[8]) && board.values_at(2, 5, 8).include?(player)
      true
    elsif (board[0] == board[4] && board[4] == board[8]) && board.values_at(0, 4, 8).include?(player)
      true
    elsif (board[2] == board[4] && board[4] == board[6]) && board.values_at(2, 4, 6).include?(player)
      true
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/AbcSize
game = Game.new
game.welcome
game.user_input