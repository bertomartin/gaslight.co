# This migration comes from training_app (originally 20130924203755)
class AddDemoToChapters < ActiveRecord::Migration
  def change
    add_column :training_app_chapters, :demo, :boolean
  end
end
