class EmbedsController < ApplicationController
  before_action :set_embed, only: [:show, :edit, :destroy]
  before_action :set_board, only: [:new, :create, :edit]
  before_action :authenticate_user!

  def show
  end

  def new
    @embed = Embed.new
  end

  def create
    @embed = @board.embeds.build(embed_params)
    # @embed = MediaAsset.new(embed_params)
    if @embed.save
      redirect_to board_url(@board), notice: "Board was successfully created."
    else
      redirect_to board_url(@board), alert: "Cant't create new embed"
    end
  end

  def edit
  end

  def destroy
    @embed.destroy
    respond_to do |format|
      format.html { redirect_to embeds_url, notice: 'Embed was successfully destroyed.' }
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
