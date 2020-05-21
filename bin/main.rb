#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/BlockNesting
require_relative '../lib/players.rb'
require_relative '../lib/game.rb'

@game = Game.new
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
  @playerz.player(player_obj[1], player_obj[2])
  puts "#{player_obj[1]} is 'X' (player1) and #{player_obj[2]} is 'O' (player2)"
end

def play
  welcome
  game_over = false
  puts @game.display_board
  until game_over == true
    puts 'Select a number between 1-9'
    input = @game.input_to_index(gets.chomp)
    if !@game.valid_move?(input)
      puts 'Invalid move, number already taken or out of range'
    else
      @game.move(input, @game.current_player)
      if @game.won?
        if @game.current_player == 'O'
          puts "#{@playerz.player1} won the game!"
        else
          puts "#{@playerz.player2} won the game!"
        end
        puts @game.display_board
        return game_over == true
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
  return game_over if player_response == 'no'

  @game.empty_board
  play
  play_again
end
play_again
# rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/BlockNesting
