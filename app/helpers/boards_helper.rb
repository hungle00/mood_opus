module BoardsHelper
  def block_link_to(path, style: "", **options, &block)
    style = "position: relative; " + style
    content_tag(:div, style: style, **options) do
      content_tag(:a, "", href: path, style: "position: absolute; width: 100%; height: 100%;") + capture(&block)
    end
  end
end
