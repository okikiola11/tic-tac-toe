class Players
  def initialize
    @player1 = ''
    @player2 = ''
  end

  attr_reader :player1

  attr_reader :player2

  def player(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def empty_name(player)
    return true if /\S/ =~ player

    false
  end

  def unique_name(player1, player2)
    true if player1 != player2
  end
end
