class RemoveOldDescriptionFields < ActiveRecord::Migration
  def change
    remove_column :training_app_courses, :description_close
  end
end
