namespace :posts do
  task :update_comments_count => :environment do
    require 'rewrite'
    require 'engagement'

    task_comment_counter = TaskCommentCounter.new
    
    Post.find_each do |post|
      comments_count = task_comment_counter.count(post)
      post.update_attribute(:external_comments_count, comments_count)
      sleep 2
    end
  end
end

class TaskCommentCounter

  def initialize(env = ENV)
    @reddit = Engagement::CommentCounter::Reddit.new
    @hacker_news = Engagement::CommentCounter::HackerNews.new
    if (disqus_forum_api_key = env['DISQUS_FORUM_API_KEY'])
      @disqus = Engagement::CommentCounter::Disqus.new(disqus_forum_api_key)
    end
  end
  
  def count(post)
    if @disqus
      if legacy_post_url = post.legacy_url
        legacy_counter = Engagement::CommentCounter::Threaded.new([@hacker_news,@reddit])
        counter = @disqus
        legacy_counter.comments_count(legacy_post_url) + counter.comments_count(post.url)
      else
        counter = Engagement::CommentCounter::Threaded.new([@hacker_news,@reddit,@disqus])
        counter.comments_count(post.url)
      end
    else
      counter = Engagement::CommentCounter::Threaded.new([@hacker_news,@reddit])
      counter.comments_count(post.url)
    end
  end
end
