class CreateChapters < ActiveRecord::Migration
  def change
    create_table :training_app_chapters do |t|
      t.string :title
      t.integer :order
      t.string :description
      t.string :video_url
      t.string :code_url
      t.string :poster_url
      t.references :section
    end
  end
end
