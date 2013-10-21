# This migration comes from training_app (originally 20131021205126)
class DefaultCourseOnlineToFalse < ActiveRecord::Migration
  def change
    change_column :training_app_courses, :online, :boolean, default: false
    TrainingApp::Course.where(online: nil).update_all(online: false)
  end
end
