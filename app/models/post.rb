class Post < ActiveRecord::Base

  def self.published
    where('posts.published_at <= ?', Time.now)
  end

  def self.by_publish_date
    order('posts.published_at desc')
  end

  def self.recent(max = 5)
    published.by_publish_date.limit(max)
  end

  def self.tagged(tag)
    tag ? published.tagged_with(tag.split) : scoped
  end

  def self.search(query)
    published.where('lower(posts.body) like lower(?)', "% #{query} %")
  end

  def self.written_by(author)
    published.where(author: author).by_publish_date
  end

  def self.posted_on(year = nil, month = nil, day = nil)
    posts = published
    posts = posts.where('extract(year  from posts.published_at) = ?', year) unless year.nil?
    posts = posts.where('extract(month from posts.published_at) = ?', month) unless month.nil?
    posts = posts.where('extract(day   from posts.published_at) = ?', day) unless day.nil?
    posts
  end

  def self.authors
    published.select('posts.author, count(posts.id) as post_count').group('posts.author').order('post_count desc')
  end

  validates_presence_of :title, :body, :author
  validates_length_of :title, maximum: 255

  after_validation :update_html

  acts_as_taggable
  acts_as_url :title, url_attribute: :slug, sync_url: true

  include Rails.application.routes.url_helpers
  self.default_url_options = {
    :host => 'blog.gaslight.co'
  }

  def url
    post_url(self)
  end

  def to_param
    slug
  end

  def published_on
    (published_at || Time.now).to_date
  end

  def title
    read_attribute(:title) || ""
  end

  def next
    Post.where("posts.published_at > ?", published_at).order("posts.published_at asc").first
  end

  def previous
    Post.where("posts.published_at < ?", published_at).order("posts.published_at desc").first
  end

  def type
    return "audio" if audio_url.present?
    "article"
  end

  def related(limit = 10)
    find_related_tags.limit(limit).to_a
  end

  def author_info
    @a ||= Author.find_by_tumblr(self.author)
    @a ||= {}
  end

  def author_name
    author_info[:name]
  end

  def author_email
    author_info[:email]
  end

  def author_google_plus_url
    author_info[:google_plus]
  end

  def published?
    persisted? && published_at && published_at <= Time.now
  end

  private

  def update_html
    return true if body.nil?
    self.html = Renderer.render(body)
  end
end

