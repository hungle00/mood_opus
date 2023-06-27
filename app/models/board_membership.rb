# == Schema Information
#
# Table name: board_memberships
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  board_id     :integer          not null
#  owner        :boolean
#  write_access :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class BoardMembership < ApplicationRecord
  belongs_to :user
  belongs_to :board
end
