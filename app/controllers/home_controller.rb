class HomeController < ApplicationController
  def index
    @boards = Board.publish
  end
end