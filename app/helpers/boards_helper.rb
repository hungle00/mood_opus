module BoardsHelper
  def filter_active_for?(type)
    params[:type] == type
  end

  def user_is_board_member?(board)
    board.users.include?(current_user)
  end
end
