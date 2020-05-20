#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
require_relative '../lib/players.rb'
require_relative '../lib/game.rb'

include Util

@game = Game.new
@playerz = Players.new

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

def play
  welcome
  game_over = false
  puts @game.display_board
  until game_over == true
    puts 'Select a number between 1-9'
    input = input_to_index(gets.chomp)
    if !@game.valid_move?(input)
      puts 'Invalid move, number already taken or out of range'
    else
      @game.move(input, @game.current_player)
      if @game.won?
        if @game.current_player == 'O'
          puts @game.display_board
          puts "#{@playerz.player1} won the game!"
          return game_over == true
        else
          puts @game.display_board
          puts "#{@playerz.player2} won the game!"
          return game_over == true
        end
      elsif !@game.board.include?(' ')
        puts @game.display_board
        puts 'It\'s a Draw!'
        return game_over == true
      end
    end
    puts @game.display_board
  end
end
play

def play_again
  game_over = true
  puts 'Would you like to restart the game (Yes/No)'
  player_response = gets.chomp.downcase
  return game_over if player_response != 'yes'
  @game.empty_board
  play
  play_again
end
play_again
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
