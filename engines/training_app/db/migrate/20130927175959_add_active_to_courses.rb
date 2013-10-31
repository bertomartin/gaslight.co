class AddActiveToCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :active, :boolean, default: true
  end
end
