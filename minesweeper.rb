# encoding: utf-8
# require 'colorize'

# create minesweeper board instance with awareness of size of map and number of bombs
# create empty board
# decide where bombs are: how? want to randomly place among board. board has as many cells as row times height. choose randomly from that number.
# place bombs
# show board with bombs


def assert(expression, test_desc)
  if !expression
    puts "Fail: ".red + test_desc
  else
    puts "Success: ".green + test_desc
  end
end

class MinesweeperBoard
  attr_reader :board, :bomb_locations, :render_complete_board

  def initialize(size, bombs)
    @size = size
    @bombs = bombs
    @board = []
    @bomb_locations = []
    create_empty_board
    set_bombs
    create_board_rows
    create_minesweeper_board
  end

  def create_empty_board
    (@size * @size).times{@board << "o"}
  end

  def create_board_rows
    @board = @board.each_slice(@size).to_a
  end

  def create_minesweeper_board
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        @board[row_index][cell_index] = check_cell_for_bombs(row, cell, row_index, cell_index)
      end
    end
  end

  def check_cell_for_bombs(row, cell, row_index, cell_index)
    if cell == "x"
      "x"
    else
      number_of_bombs = 0
      cells_to_check = [cell_index - 1, cell_index + 1, cell_index].delete_if{|cell_index| cell_index < 0 || cell_index >= @board.length}
      rows_to_check = [row_index - 1, row_index + 1, row_index].delete_if{|row_index| row_index < 0 || row_index >= @board.length }
      rows_to_check.each do |row_to_check|
        cells_to_check.each do |cell_to_check|
          number_of_bombs += 1 if @board[row_to_check][cell_to_check] == "x"
        end
      end
      number_of_bombs
    end
  end

  def set_bombs
    set_bomb_locations
    set_bombs_in_board
  end

  def set_bombs_in_board
    @bomb_locations.each do |bomb_location|
      @board[bomb_location] = "x"
    end
  end

  def set_bomb_locations
    @bomb_locations = (0...(@size * @size)).to_a.sample(@bombs)
  end

  def render_complete_board
    @board.each do |row|
      p row.join
    end
  end
end

# assert(MinesweeperBoard.new(2, 1).bomb_locations.length == 1, "correct number of bombs place")
# assert(MinesweeperBoard.new(4, 2).bomb_locations.length == 2, "correct number of bombs place")
# assert(MinesweeperBoard.new(4, 2).board.inject(0){|sum, value| sum += value.count("x")} == 2 , "board has correct number of bombs")
# MinesweeperBoard.new(5, 2).render_complete_board