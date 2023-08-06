# == Schema Information
#
# Table name: media_assets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MediaAsset < ApplicationRecord
  has_one :embed, as: :embeddable, touch: true

  has_one_attached :media_file
  validates :media_file, presence: true
  validates :media_file, content_type: ["image/png", "image/jpeg", "image/jpg"], max_file_size: 4.megabytes

  def image_ratio
    media_file.analyze if media_file.attached? && !media_file.analyzed?

    (media_file.metadata['height'].to_f / media_file.metadata['width']).round(1)
  end
end
