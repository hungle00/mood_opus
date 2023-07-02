# == Schema Information
#
# Table name: media_assets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MediaAsset < ApplicationRecord
  has_one :embed, as: :embeddable, touch: true

  has_one_attached :media_file
end
