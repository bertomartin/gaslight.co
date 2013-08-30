class AddImageUrlToTrainingAppCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :image_url, :string
  end
end
