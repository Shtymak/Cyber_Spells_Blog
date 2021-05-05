module ApplicationHelper
  def like_button_tag post, pre_like
    return button_to 'Unlike', post_like_path(post, pre_like), method: :delete, remote: true if pre_like
    button_to 'Like', post_likes_path(post), method: :post, remote: true
  end
end
