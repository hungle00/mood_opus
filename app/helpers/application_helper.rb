module ApplicationHelper
  def flash_classes(flash_type)
    {
      notice: "bg-green-500 border-green-700",
      alert:   "bg-red-500 border-red-700",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def avatar_for(user, class_names=nil)
    avatar_class_names = "avatar #{class_names}"
    if user.avatar.attached?
      image_tag(user.avatar, class: avatar_class_names)
    else
      image_tag('https://avatars.githubusercontent.com/u/39127302?v=4', class: avatar_class_names)
    end
  end
end
