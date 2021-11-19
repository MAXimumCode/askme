module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
