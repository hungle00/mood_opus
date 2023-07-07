module ApplicationHelper
  def flash_classes(flash_type)
    {
      notice: "bg-green-500 border-green-700",
      alert:   "bg-red-500 border-red-700",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def current_user_avatar
    if current_user.avatar.attached?
      image_tag(current_user.avatar, class: "avatar h-9 w-9")
    else
      image_tag('https://avatars.githubusercontent.com/u/39127302?v=4', class: "avatar h-9 w-9")
    end
  end
end
