class DropWorkshops < ActiveRecord::Migration
  def change
    drop_table :training_app_workshops
  end
end
