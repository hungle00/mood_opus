class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :board_memberships, dependent: :destroy
  has_many :users, through: :board_memberships

  validates :title, presence: true
end
