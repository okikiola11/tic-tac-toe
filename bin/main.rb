#!/usr/bin/env ruby

puts 'Welcome to Tic Tac Toe'
puts ' Please Enter your name (Player 1): '
player1 = gets.strip.upcase

puts 'Please Enter your name (Player 2): '
player2 = gets.strip.upcase

puts " #{player1} is X and #{player2} is O"

# display board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '----------- '
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '----------- '
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Convert the user input to an array index
def input_to_index(user_input)
  user_input.to_i - 1
end

def position_taken?(board, index)
  board[index] == ' ' ? 'false' : 'true'
end

def valid_move?(board, index)
  return true if index.between?(0..8) && !position_taken?(board, index)
end

def winner
  puts "Congratulations #{player_1} has won the game"
end

# count the number of times the player
def play
  puts 'select a move'
  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  display_board(board)
end
play
