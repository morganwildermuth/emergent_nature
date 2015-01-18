require 'sinatra'
require 'shotgun'
require_relative "minesweeper.rb"

class MineSweeperApp < Sinatra::Base
  get '/' do
    @game_board = MinesweeperBoard.new(5, 2).render_complete_board
    erb :game
  end
end