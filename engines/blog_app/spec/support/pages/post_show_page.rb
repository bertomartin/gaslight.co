class PostShowPage
  include Capybara::DSL

  def visit_post(post)
    visit("/blog/#{post.slug}")
  end

  def title
    find('.post__title').text
  end

  def tags
    all('.tag').collect(&:text)
  end

  def related_posts
    all('.related-post').collect(&:text)
  end
end

