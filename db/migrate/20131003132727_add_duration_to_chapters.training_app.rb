# This migration comes from training_app (originally 20131003132522)
class AddDurationToChapters < ActiveRecord::Migration
  def change
    add_column :training_app_chapters, :duration, :integer
  end
end
