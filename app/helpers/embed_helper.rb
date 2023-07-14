module EmbedHelper
  VIDEO_HEIGHT_SCALE = 6
  EMBED_INFO_HEIGHT_SCALE = 2

  def iframe_media_tag(src, class_names: "")
  	tag.iframe class: class_names, src:"#{src}", allowfullscreen: true
  end

  # embed card's height = media's height + embed info's height
  def embed_card_ratio(embed)
    media_height_scale = if embed.embed_link?
      VIDEO_HEIGHT_SCALE
    elsif embed.media_asset.image_ratio > 2
      20
    else
      (embed.embeddable.image_ratio * 10).to_i
    end
    media_height_scale + EMBED_INFO_HEIGHT_SCALE
  end
end
