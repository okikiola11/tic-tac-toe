# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
class Wins
  def won?(board, sym)
    if (board[0] == board[1] && board[1] == board[2]) && board.values_at(0, 1, 2).include?(sym)
      true
    elsif (board[3] == board[4] && board[4] == board[5]) && board.values_at(3, 4, 5).include?(sym)
      true
    elsif (board[6] == board[7] && board[7] == board[8]) && board.values_at(6, 7, 8).include?(sym)
      true
    elsif (board[0] == board[3] && board[3] == board[6]) && board.values_at(0, 3, 6).include?(sym)
      true
    elsif (board[1] == board[4] && board[4] == board[7]) && board.values_at(1, 4, 7).include?(sym)
      true
    elsif (board[2] == board[5] && board[5] == board[8]) && board.values_at(2, 5, 8).include?(sym)
      true
    elsif (board[0] == board[4] && board[4] == board[8]) && board.values_at(0, 4, 8).include?(sym)
      true
    elsif (board[2] == board[4] && board[4] == board[6]) && board.values_at(2, 4, 6).include?(sym)
      true
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
