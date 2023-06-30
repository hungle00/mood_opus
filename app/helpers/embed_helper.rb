module EmbedHelper
  def iframe_media_tag(src, class_names: "")
  	tag.iframe class: class_names, src:"#{src}", allowfullscreen: true
  end
end
