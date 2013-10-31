class RemoveFeaturedColumnFromCourses < ActiveRecord::Migration
  def change
    remove_column :training_app_courses, :featured
  end
end
