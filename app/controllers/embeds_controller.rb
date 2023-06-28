class EmbedsController < ApplicationController
  before_action :set_embed, only: [:show, :edit, :destroy]
  before_action :authenticate_user!

  def show
  end

  def new
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
end
