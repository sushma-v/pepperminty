module PostsHelper
  def render_with_hashtags(content)
    content.gsub(/#\w+/) { |word| link_to word, "/blog_search/#{word.delete('#')}"}.html_safe
  end

  def escape_html(content)
    CGI.escape_html(content)
  end
end
