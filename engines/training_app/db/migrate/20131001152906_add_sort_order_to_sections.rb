class AddSortOrderToSections < ActiveRecord::Migration
  def change
    add_column :training_app_sections, :sort_order, :integer
  end
end
