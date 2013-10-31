class AddDurationToChapters < ActiveRecord::Migration
  def change
    add_column :training_app_chapters, :duration, :integer
  end
end
