class HomeController < ApplicationController
  def index
    @boards = Board.all
  end
end