#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
require_relative '../lib/wins.rb'
require_relative '../lib/players.rb'
require_relative '../lib/game.rb'

class PlayGame
  include Game

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @playerz = Players.new
  end

  def welcome
    puts 'Welcome to Tic Tac Toe'
    puts 'Please Enter your name (Player 1): '
    player1_name = gets.strip.upcase
    until @playerz.validate_name(player1_name)
      puts 'Player 1: Enter Valid name'
      player1_name = gets.chomp.upcase
    end
    puts 'Please Enter your name (Player 2): '
    player2_name = gets.strip.upcase
    until @playerz.validate_name(player2_name)
      puts 'Player 2: Enter Valid name'
      player2_name = gets.chomp.upcase
    end
    @playerz.player(player1_name, player2_name)
    puts "#{player1_name} is 'X' (player1) and #{player2_name} is 'O' (player2)"
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    welcome
    wins = Wins.new
    game_over = false
    display_board
    until game_over == true
      puts 'Select a number between 1-9'
      input = input_to_index(gets.chomp)
      if !valid_move?(@board, input)
        puts 'Invalid move, number already taken or out of range'
      else
        move(@board, input, current_player)
        if wins.won?(@board, 'X')
          display_board
          puts "#{@playerz.player1} won the game!"
          return game_over = true
        elsif !@board.include?(' ')
          display_board
          puts 'It\'s a Draw!'
          return game_over = true
        end
        if wins.won?(@board, 'O')
          display_board
          puts "#{@playerz.player2} won the game!"
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

  def play_again
    play = PlayGame.new
    game_over = true
    puts 'Would you like to restart the game (Yes/No)'
    player_response = gets.chomp.downcase
    return game_over if player_response != 'yes'

    play.play
    play.play_again
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
game = PlayGame.new
game.play
game.play_again
