# This migration comes from blog_app (originally 20131030185330)
class ConvertTaggableTypes < ActiveRecord::Migration
  def up
    ActsAsTaggableOn::Tagging.where(taggable_type: "Post").update_all(taggable_type: "BlogApp::Post")
  end

  def down
    ActsAsTaggableOn::Tagging.where(taggable_type: "BlogApp::Post").update_all(taggable_type: "Post")
  end
end
