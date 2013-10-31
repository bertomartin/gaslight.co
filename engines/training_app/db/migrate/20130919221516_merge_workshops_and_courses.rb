class MergeWorkshopsAndCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :capacity, :integer
    add_column :training_app_courses, :early_bird_price, :integer
    add_column :training_app_courses, :early_bird_end_date, :datetime
    add_column :training_app_courses, :registration_link, :string
    add_column :training_app_courses, :parent_course_id, :integer
    add_column :training_app_courses, :online, :boolean
  end
end
