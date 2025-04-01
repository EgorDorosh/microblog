module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def image_for(user, options = { size: 80 })
    return link_to gravatar_for(user, options), user unless user.avatar.attached?

    size = options[:size]
    saver = { quality: 80, strip: true }
    link_to image_tag(user.avatar.variant(resize_to_limit: [size, size], saver:), class: 'gravatar'), user
  end
end
