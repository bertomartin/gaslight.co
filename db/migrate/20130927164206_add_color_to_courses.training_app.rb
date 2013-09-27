# This migration comes from training_app (originally 20130927135907)
class AddColorToCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :color_primary, :string
    add_column :training_app_courses, :color_secondary, :string
  end
end
