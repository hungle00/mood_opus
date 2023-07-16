class MembershipsController < ApplicationController
  before_action :set_board
  before_action :authenticate_user!

  def new
    @memberships = @board.board_memberships.includes(:user)
    @membership = @board.board_memberships.new
  end

  def create
    @membership = @board.board_memberships.build(membership_params)
    if @membership.save
      redirect_to board_url(@board), notice: "Send invite to user successfully."
    else
      redirect_to board_url(@board), alert: "Cant't send invite"
    end
  end

  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to @board, notice: 'Remove member from board.' }
      format.json { head :no_content }
    end
  end

  private

  def set_board
    @board = Board.friendly.find(params[:board_id])
  end

  def membership_params
    params.require(:board_membership).permit(:user_id, :write_access)
  end
end
