class EmbedsController < ApplicationController
  before_action :set_embed, only: [:show, :edit, :update, :destroy]
  before_action :set_board
  before_action :authenticate_user!

  def show
  end

  def new
    @embed = Embed.new
  end

  def create
    @embed = @board.embeds.build(embed_params)
    if @embed.save
      redirect_to board_url(@board), notice: "Embed was successfully created."
    else
      redirect_to board_url(@board), alert: "Cant't create new embed"
    end
  rescue ActiveRecord::NotNullViolation => error
    logger.debug error
    redirect_to board_url(@board), alert: "Cant't create new embed"
  end

  def edit
  end

  def update
    if @embed.update(title: params[:embed][:title])
      redirect_to @board, notice: "Embed was successfully updated."
    else
      redirect_to @board, alert: "Cant't update new embed"
    end
  end

  def destroy
    @embed.destroy
    respond_to do |format|
      format.html { redirect_to @board, notice: 'Embed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_embed
    @embed = Embed.find(params[:id])
  end

  def set_board
    @board = Board.friendly.find(params[:board_id])
  end

  def embed_params
    params.require(:embed).permit(:title, :input, :media_file)
  end
end
