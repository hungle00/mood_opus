# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :board_memberships
  has_many :boards, through: :board_memberships
  has_many :notifications, as: :recipient, dependent: :destroy
  
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
  validates :avatar, content_type: ["image/png", "image/jpeg", "image/jpg"], max_file_size: 2.megabytes

  scope :search_by_name_or_email, ->(value) {
    where("name LIKE ? OR email LIKE ?", "%#{value}%", "%#{value}%")
  }

  def display_name
    name.presence || email.split("@").first
  end
end
