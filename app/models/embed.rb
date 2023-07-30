# == Schema Information
#
# Table name: embeds
#
#  id              :bigint           not null, primary key
#  board_id        :bigint           not null
#  title           :string
#  embeddable_type :string
#  embeddable_id   :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Embed < ApplicationRecord
  belongs_to :board, counter_cache: true
  delegated_type :embeddable, types: %w(EmbedLink MediaAsset)
  delegate :users, to: :board
 
  attribute :input, :string
  attribute :media_file
  # validates :input, presence: true, on: :create
  scope :filter_by_type, ->(type) { where(embeddable_type: type) }

  after_initialize do
    next if persisted?

    if input&.start_with? "http"
      self.embeddable = EmbedLink.new(url: input)
    else
      self.embeddable = MediaAsset.new(media_file: media_file)
    end
  end
end
