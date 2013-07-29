require 'rewrite'
require 'engagement'

class PostCommentCounter

  def self.from_env(env = ENV)
    new counter_for_env(env)
  end

  def self.counter_for_env(env)
    sources = []
    sources << Engagement::CommentCounter::Reddit.new
    sources << Engagement::CommentCounter::HackerNews.new
    
    if (disqus_forum_api_key = env['DISQUS_FORUM_API_KEY'])
      sources << Engagement::CommentCounter::Disqus.new(disqus_forum_api_key)
    end

    Engagement::CommentCounter::Threaded.new(sources)
  end

  def initialize(counter)
    @counter = counter
  end
  
  def count(post)
    count = 0

    [post.url, post.legacy_url].compact.each do |url|
      count += @counter.comments_count(url)
      # reddit has a limit of 30 requests per minute
      sleep 2
    end

    count
  end

end