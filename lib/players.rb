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

  def validate_name(player)
    true if /\S/ =~ player
  end


end
