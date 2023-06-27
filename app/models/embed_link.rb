# == Schema Information
#
# Table name: embed_links
#
#  id         :integer          not null, primary key
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EmbedLink < ApplicationRecord
  validates :url, presence: true
  has_one :embed, as: :embeddable, touch: true
end
