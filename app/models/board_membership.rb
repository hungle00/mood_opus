# == Schema Information
#
# Table name: board_memberships
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  board_id     :bigint           not null
#  owner        :boolean
#  write_access :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class BoardMembership < ApplicationRecord
  belongs_to :user
  belongs_to :board

  after_create_commit :notify_user

  private

  def notify_user
    MembershipNotification.with(board: board).deliver(user)
  end
end
