module BoardsHelper
  def block_link_to(path, style: "", **options, &block)
    style = "position: relative; " + style
    content_tag(:div, style: style, **options) do
      content_tag(:a, "", href: path, style: "position: absolute; width: 100%; height: 100%;") + capture(&block)
    end
  end

  def filter_active_for?(type)
    params[:type] == type
  end

  def members_for_select(board)
    current_member = board.board_memberships.includes(:user).map(&:user)
    User.pluck(:email, :id) - current_member.pluck(:email, :id)
  end
end
