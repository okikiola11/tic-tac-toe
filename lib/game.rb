module Game
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
      counter += 1 if spaces.include?('X') || spaces.include?('O')
    end
    counter
  end

  def current_player
    turn_count(@board).even? ? 'X' : 'O'
  end
end
