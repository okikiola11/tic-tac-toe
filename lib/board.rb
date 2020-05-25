class Board
  def initialize
    @board_cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  attr_accessor :board_cells

  def display_board
    [
      [" #{@board_cells[0]} | #{@board_cells[1]} | #{@board_cells[2]} "],
      ['----------- '],
      [" #{@board_cells[3]} | #{@board_cells[4]} | #{@board_cells[5]} "],
      ['----------- '],
      [" #{@board_cells[6]} | #{@board_cells[7]} | #{@board_cells[8]} "]
    ]
  end
end
