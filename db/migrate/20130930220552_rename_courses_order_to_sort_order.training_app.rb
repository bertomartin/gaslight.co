# This migration comes from training_app (originally 20130930213343)
class RenameCoursesOrderToSortOrder < ActiveRecord::Migration
  def change
    rename_column :training_app_chapters, :order, :sort_order
  end
end
