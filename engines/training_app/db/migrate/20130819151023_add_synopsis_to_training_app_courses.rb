class AddSynopsisToTrainingAppCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :synopsis, :text
  end
end
