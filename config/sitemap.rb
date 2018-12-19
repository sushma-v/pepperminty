# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.pepperminty.co.uk"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add root_path, :changefreq => 'weekly'
  add '/home', :changefreq => 'weekly'
  add '/about', :changefreq => 'weekly'
  add '/website', :changefreq => 'weekly'
  add '/seo', :changefreq => 'weekly'
  add '/paid_search', :changefreq => 'weekly'
  add '/social', :changefreq => 'weekly'
  add '/contact', :changefreq => 'weekly'
  add '/privacy_policy', :changefreq => 'weekly'
  add '/cookie_policy', :changefreq => 'weekly'
end
