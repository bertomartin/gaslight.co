class AddExternalCommentsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :external_comments_count, :integer, :default => 0
  end
end
