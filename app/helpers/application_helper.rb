module ApplicationHelper
  def flash_classes(flash_type)
    {
      notice: "bg-green-500 border-green-700",
      alert:   "bg-red-500 border-red-700",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
