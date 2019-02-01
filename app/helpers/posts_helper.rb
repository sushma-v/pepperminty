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
end
