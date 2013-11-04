class ChangeChapterDescriptionToText < ActiveRecord::Migration
  def change
    change_column :training_app_chapters, :description, :text
  end
end
