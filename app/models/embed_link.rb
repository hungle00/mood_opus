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

  BILI_URL_REGEXP = %r{(https?://)(www.)?(bilibili\.com/video/av)([0-9]+)(&\S+)?(\?\S+)?}
  BILI_B_URL_REGEXP = %r{(https?://)(www.)?(bilibili\.com/video/BV)([a-zA-Z0-9]+)(&\S+)?(\?\S+)?}
  YOUTUBE_URL_REGEXP = %r{(https?://)(www.)?(youtube\.com/watch\?v=|youtu\.be/|youtube\.com/watch\?feature=player_embedded&v=)([A-Za-z0-9_\-]*)(&\S+)?(\?\S+)?}

  def embed_link_url
    url.gsub!(BILI_URL_REGEXP) do
      bili_id = Regexp.last_match(4)
      src = "//player.bilibili.com/player.html?aid=#{bili_id}"
    end
    url.gsub!(BILI_B_URL_REGEXP) do
      bili_id = Regexp.last_match(4)
      src = "//player.bilibili.com/player.html?bvid=BV#{bili_id}"  
    end
    url.gsub!(YOUTUBE_URL_REGEXP) do
      youtube_id = Regexp.last_match(4)
      src = "//www.youtube.com/embed/#{youtube_id}"
    end

    url
  end
end
