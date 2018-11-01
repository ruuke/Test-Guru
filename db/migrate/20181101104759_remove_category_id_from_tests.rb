class RemoveCategoryIdFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :category_id, :integer
  end
end
