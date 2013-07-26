# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "engagement"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Guterl"]
  s.date = "2013-07-25"
  s.description = "TODO: Write a gem description"
  s.email = ["michael@diminishing.org"]
  s.files = [".gitignore", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "engagement.gemspec", "lib/engagement.rb", "lib/engagement/comment_counter.rb", "lib/engagement/comment_counter/disqus.rb", "lib/engagement/comment_counter/hacker_news.rb", "lib/engagement/comment_counter/reddit.rb", "lib/engagement/comment_counter/threaded.rb", "lib/engagement/version.rb", "spec/cassettes/Engagement_CommentCounter_Disqus/when_we_don_t_own_the_url/returns_zero_when_we_don_t_own_the_url.yml", "spec/cassettes/Engagement_CommentCounter_Disqus/when_we_own_the_url/returns_the_number_of_comments_for_the_given_url.yml", "spec/cassettes/Engagement_CommentCounter_HackerNews/returns_the_number_of_comments_for_the_given_url.yml", "spec/cassettes/Engagement_CommentCounter_Reddit/with_a_single_listing_returned/.yml", "spec/cassettes/Engagement_CommentCounter_Reddit/with_multiple_listings_returned/.yml", "spec/cassettes/Engagement_CommentCounter_Reddit/with_no_results/.yml", "spec/engagement/comment_counter/disqus_spec.rb", "spec/engagement/comment_counter/hacker_news_spec.rb", "spec/engagement/comment_counter/reddit_spec.rb", "spec/engagement/comment_counter_spec.rb", "spec/engagement/threaded_comment_counter_spec.rb", "spec/spec_helper.rb"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "TODO: Write a gem summary"
  s.test_files = ["spec/cassettes/Engagement_CommentCounter_Disqus/when_we_don_t_own_the_url/returns_zero_when_we_don_t_own_the_url.yml", "spec/cassettes/Engagement_CommentCounter_Disqus/when_we_own_the_url/returns_the_number_of_comments_for_the_given_url.yml", "spec/cassettes/Engagement_CommentCounter_HackerNews/returns_the_number_of_comments_for_the_given_url.yml", "spec/cassettes/Engagement_CommentCounter_Reddit/with_a_single_listing_returned/.yml", "spec/cassettes/Engagement_CommentCounter_Reddit/with_multiple_listings_returned/.yml", "spec/cassettes/Engagement_CommentCounter_Reddit/with_no_results/.yml", "spec/engagement/comment_counter/disqus_spec.rb", "spec/engagement/comment_counter/hacker_news_spec.rb", "spec/engagement/comment_counter/reddit_spec.rb", "spec/engagement/comment_counter_spec.rb", "spec/engagement/threaded_comment_counter_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<debugger>, [">= 0"])
      s.add_runtime_dependency(%q<hacker_news_search>, ["~> 0.0.6"])
      s.add_runtime_dependency(%q<snoo>, [">= 0"])
      s.add_runtime_dependency(%q<disqus>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<debugger>, [">= 0"])
      s.add_dependency(%q<hacker_news_search>, ["~> 0.0.6"])
      s.add_dependency(%q<snoo>, [">= 0"])
      s.add_dependency(%q<disqus>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<debugger>, [">= 0"])
    s.add_dependency(%q<hacker_news_search>, ["~> 0.0.6"])
    s.add_dependency(%q<snoo>, [">= 0"])
    s.add_dependency(%q<disqus>, [">= 0"])
  end
end
