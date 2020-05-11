#!/usr/bin/env ruby

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
    @board[index] = player
  end

  def valid_move?(board, index)
    if index.between?(0,8) && board[index] == " "
      return true
    end
  end

  def turn_count(board)
    counter = 0
    @board.each do |spaces|
       if spaces == @player1 || spaces == @player2
          counter += 1
       end
    end
    counter
  end

  def current_player(board)
    turn_count(@board) % 2 == 0 ? @player1 : @player2
  end

  def user_input
    display_board
    count = 0
    while count <= 9
      puts "Select a number between 1-9"
      input = input_to_index(gets.chomp)
      if !valid_move?(@board, input)
        puts "Invalid move, number already taken or out of range"
      else
        move(@board, input, current_player(@board))
      end
      display_board
      count += 1
    end
  end
end

game = Game.new
game.welcome
game.user_input
