#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/BlockNesting
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
  game_over = false
  puts @game.board.display_board
  until game_over == true
    puts 'Select a number between 1-9'
    input = @game.input_to_index(gets.chomp)
    puts @game.check_players_turn

    if !@game.valid_move?(input)
      puts 'Invalid move, number already taken or out of range'
    else
      @game.move(input, @game.current_player)
      if @game.won?
        if @game.current_player == 'O'
          puts "#{@game.playerz.player1} won the game!"
        else
          puts "#{@game.playerz.player2} won the game!"
        end
        puts @game.board.display_board
        return game_over == true
      elsif !@game.board.board_cells.include?(' ')
        puts @game.board.display_board
        puts 'It\'s a Draw!'
        return game_over == true
      end
    end
    puts @game.board.display_board
  end
end
play

def play_again
  game_over = true
  puts 'Would you like to restart the game (Yes/No)'
  player_response = gets.chomp.downcase
  until player_response == 'no' || player_response == 'yes'
    puts 'Would you like to restart the game (Yes/No)'
    player_response = gets.chomp.downcase
  end
  return game_over unless player_response == 'yes'
  @game.empty_board
  play
  play_again

  if player_response == 'no'
    puts 'Your response should be either Yes/No'
    @game.empty_board
    play_again
  end
end
play_again
# rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/BlockNesting
