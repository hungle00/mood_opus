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
  delegated_type :embeddable, types: %w(EmbedLink)

  attribute :input, :string
  validates :input, presence: true, on: :create

  after_initialize do
    next if persisted?

    self.embeddable = EmbedLink.new(url: input)
  end
end
