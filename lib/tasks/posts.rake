namespace :posts do
  task :update_comments_count => :environment do
    comment_counter = BlogApp::PostCommentCounter.from_env

    BlogApp::Post.find_each do |post|
      comments_count = comment_counter.count(post)
      post.update_attribute(:external_comments_count, comments_count)
    end
  end
end
