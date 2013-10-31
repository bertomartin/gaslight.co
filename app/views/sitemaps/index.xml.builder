xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  static_pages.each do |page|
    xml.url do
      xml.loc page_url(page)
      xml.changefreq("monthly")
    end
  end

  posts.each do |post|
    xml.url do
      xml.loc blog_app.post_url(post)
      xml.lastmod post.updated_at.strftime("%F")
      xml.changefreq("monthly")
    end
  end
end

