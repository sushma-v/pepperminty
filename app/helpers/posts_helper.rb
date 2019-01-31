module PostsHelper
  def render_with_hashtags(content)
    content.gsub(/#\w+/) { |word|
      link_to word, blog_search_path(query: word)
    }
  end

  def escape_html(content)
    CGI.escape_html(content)
  end
end
