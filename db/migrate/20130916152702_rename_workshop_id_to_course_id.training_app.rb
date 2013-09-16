# This migration comes from training_app (originally 20130913153215)
class RenameWorkshopIdToCourseId < ActiveRecord::Migration
  def change
    rename_column :training_app_registrations, :workshop_id, :course_id
  end
end
