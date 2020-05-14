#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
require_relative '../lib/wins.rb'
require_relative '../lib/players.rb'

class Game
  def initialize
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
    playerz = Players.new
    counter = 0
    board.each do |spaces|
      counter += 1 if spaces.include?(playerz.player1) || spaces.include?(playerz.player2)
    end
    counter
  end

  def current_player
    playerz = Players.new
    turn_count(@board).even? ? playerz.player1 : playerz.player2
  end

  def user_input
    wins = Wins.new
    playerz = Players.new
    game_over = false
    display_board
    until game_over == true
      puts 'Select a number between 1-9'
      input = input_to_index(gets.chomp)
      if !valid_move?(@board, input)
        puts 'Invalid move, number already taken or out of range'
      else
        move(@board, input, current_player)
        if wins.won?(@board, playerz.player1)
          display_board
          puts "#{playerz.player1} won the game!"
          return game_over = true
        elsif !@board.include?(' ')
          display_board
          puts 'It\'s a Draw!'
          return game_over = true
        end
        if wins.won?(@board, playerz.player2)
          display_board
          puts "#{playerz.player2} won the game!"
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
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
game = Game.new
game.welcome
game.user_input
