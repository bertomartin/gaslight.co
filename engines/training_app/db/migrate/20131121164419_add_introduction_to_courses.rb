class AddIntroductionToCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :introduction, :text
  end
end
