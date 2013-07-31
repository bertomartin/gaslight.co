class CreateOldSlugs < ActiveRecord::Migration
  def change
    create_table :old_slugs do |t|
      t.string :old_slug
      t.string :new_slug
      t.references :post
      t.timestamps
    end
    add_index :old_slugs, :old_slug
  end
end
