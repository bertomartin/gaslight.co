class RenameTrainersToInstructors < ActiveRecord::Migration
  def change
    rename_table :training_app_trainers, :training_app_instructors

    # Join table :courses to :instructors
    rename_column :training_app_courses_trainers, :trainer_id, :instructor_id
    rename_table :training_app_courses_trainers, :training_app_courses_instructors
  end
end
