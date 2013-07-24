namespace :posts do
  task :update_comments_count => :environment do
    require 'engagement'

    reddit = Engagement::CommentCounter::Reddit.new
    hacker_news = Engagement::CommentCounter::HackerNews.new
    #disqus = Engagement::CommentCounter::Disqus.new(ENV.fetch('DISQUS_FORUM_API_KEY'))
    counter = Engagement::CommentCounter.new([reddit, hacker_news])

    Post.find_each do |post|
      comments_count = counter.comments_count(post.url)
      post.update_attribute(:external_comments_count, comments_count)
      sleep 2
    end
  end
end
