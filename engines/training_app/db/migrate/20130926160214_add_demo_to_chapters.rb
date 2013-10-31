class AddDemoToChapters < ActiveRecord::Migration
  def change
    add_column :training_app_chapters, :demo, :boolean
  end
end
