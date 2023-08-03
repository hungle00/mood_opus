# To deliver this notification:
#
# MembershipNotification.with(post: @post).deliver_later(current_user)
# MembershipNotification.with(post: @post).deliver(current_user)

class MembershipNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  param :board

  # Define helper methods to make rendering easier.
  
  def message
    "You are invited to join this board: #{params[:board].title}"
  end
  
  def url
    board_path(params[:board])
  end
end
