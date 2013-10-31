class RenameTagsOnPosts < ActiveRecord::Migration
  def up
    rename_column :posts, :tags, :old_tags

    # this was failing because we removed the Post model
    # Post.reset_column_information
    # Post.where('old_tags is not null').each do |post|
    #   post.tags = post.old_tags.split(',')
    #   post.save
    # end
  end

  def down
    rename_column :posts, :old_tags, :tags
  end
end
