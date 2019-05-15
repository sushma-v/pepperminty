module PostsHelper
  def render_with_hashtags(content)
    unescape_html(content).gsub(/#\w+/) { |word| link_to word, "/blog_search/#{word.delete('#')}"}
  end

  def unescape_html(content)
    CGI.unescapeHTML(content)
  end

  def escape_html(content)
    CGI.escapeHTML(content)
  end

  def display_main_image(post)
    if post.main_image.empty?
      cl_image_tag Post.first.main_image, alt: post.alt_text rescue nil
    else
      cl_image_tag post.main_image, alt: post.alt_text rescue nil
    end
  end
end
