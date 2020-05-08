#!/usr/bin/env ruby

puts 'Welcome to Tic Tac Toe'
puts ' Please Enter your name (Player 1): '
player_1 = gets.strip.upcase

puts 'Please Enter your name (Player 2): '
player_2 = gets.strip.upcase

puts " #{player_1} is X and #{player_2} is O"
player_1_symbol = 'X'
player_2_symbol = 'O'

#display board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts " ---------- "
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts " ----------- "
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Convert the user input to an array index
def input_to_index(user_input)
  user_input.to_i - 1
end

def position_taken?(board, index)
  board[index] == " " ? 'false' : 'true'
end

def valid_move?(board, index)
  if index.between?(0..8) && !position_taken?(board, index)
    return true
  end
end

def winner
  puts "Congratulations #{player_1} has won the game"
end

#count the number of times the player
def play
  puts "select a move"
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  display_board(board)
end
play
