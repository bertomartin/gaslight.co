module BlogApp
  module ApplicationHelper
    def tag_list(tags)
      tags.collect do |t|
        link_to(t, posts_path(tagged: t.name), class: 'tag')
      end.join(" ").html_safe
    end

    def popular_tag_links(tags)
      tags.collect do |t|
        link_to(t.name, posts_path(tagged: t.name), class: 'tag', data:{ count: t.count })
      end.join(" ").html_safe
    end
    def gravatar_url(email, size = "32x32")
      return "" if email.nil?
      hash = Digest::MD5.hexdigest(email)
      "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
    end
  end
end
