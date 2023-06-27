# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :board_memberships, dependent: :destroy
  has_many :users, through: :board_memberships
  has_many :embeds, dependent: :destroy

  accepts_nested_attributes_for :embeds, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
end
