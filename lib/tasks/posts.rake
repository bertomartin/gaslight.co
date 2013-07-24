namespace :posts do
  task :update_comments_count => :environment do
    def sources(env = ENV)
      sources = [
        reddit = Engagement::CommentCounter::Reddit.new,
        hacker_news = Engagement::CommentCounter::HackerNews.new,
      ]

      if (disqus_forum_api_key = env['DISQUS_FORUM_API_KEY'])
        disqus = Engagement::CommentCounter::Disqus.new(disqus_forum_api_key)
        sources << disqus
      end

      sources
    end

    require 'rewrite'
    require 'engagement'

    counter = Engagement::CommentCounter::Threaded.new(sources)

    Post.find_each do |post|
      post_url = post.url

      tumblr_posts_hash = Rewrite.tumblr_posts_hash.invert
      if tumblr_post_id = tumblr_posts_hash[post.slug]
        post_url = "http://blog.gaslight.co/post/#{tumblr_post_id}/#{post.slug}"
      end
      puts post_url

      comments_count = counter.comments_count(post_url)
      post.update_attribute(:external_comments_count, comments_count)
      sleep 2
    end
  end
end
