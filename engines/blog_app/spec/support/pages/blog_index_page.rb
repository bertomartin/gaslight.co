class BlogIndexPage
  include Capybara::DSL

  def visit_page
    visit '/blog'
  end

  def full_posts
    all('.post')
  end
end

