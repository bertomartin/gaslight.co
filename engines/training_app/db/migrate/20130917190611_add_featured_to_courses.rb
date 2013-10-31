class AddFeaturedToCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :featured, :boolean
  end
end
