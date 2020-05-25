#!/usr/bin/env ruby
require_relative '../lib/players.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

@playerz = Players.new

def welcome
  player_obj = []
  @player = 1
  @passed = false
  puts 'Welcome to Tic Tac Toe'
  until @player == 3
    puts "Please Enter a unique name (Player #{@player}): "
    player_obj[@player] = gets.chomp.upcase
    @passed = @playerz.empty_name(player_obj[@player]) && @playerz.unique_name(player_obj[1], player_obj[2])
    @player += 1 if @passed == true
    @passed = false
  end
  @game = Game.new(player_obj[1], player_obj[2])
  puts "#{player_obj[1]} is 'X' (player1) and #{player_obj[2]} is 'O' (player2)"
end

def play
  welcome
  puts @game.board.display_board
  until @game.game_over?
    puts @game.check_players_turn
    puts 'Select a number between 1-9'
    input = @game.input_to_index(gets.chomp)

    if !@game.valid_move?(input)
      puts 'Invalid move, number already taken or out of range'
    else
      @game.move(input, @game.current_player)
      puts @game.check_win
    end
    puts @game.board.display_board
  end
end
play

def play_again
  game_over = true
  puts 'Would you like to restart the game (Yes/No)'
  player_response = gets.chomp.downcase
  until player_response.include?('no') || player_response.include?('yes')
    puts 'Would you like to restart the game (Yes/No)'
    player_response = gets.chomp.downcase
  end
  return game_over unless player_response == 'yes'

  @game.empty_board
  play
  play_again
end
play_again
