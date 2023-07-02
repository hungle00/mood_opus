# == Schema Information
#
# Table name: embeds
#
#  id              :integer          not null, primary key
#  board_id        :integer          not null
#  title           :string
#  embeddable_type :string
#  embeddable_id   :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Embed < ApplicationRecord
  belongs_to :board
  delegated_type :embeddable, types: %w(EmbedLink MediaAsset)
  delegate :users, to: :board
 
  attribute :input, :string
  validates :input, presence: true, on: :create

  after_initialize do
    next if persisted?

    if input&.start_with? "http"
      self.embeddable = EmbedLink.new(url: input)
    else
      self.embeddable = MediaAsset.new(media_file: input)
    end
  end
end
