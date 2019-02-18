class AddIndexToCatigories < ActiveRecord::Migration[5.2]
  def change
  	add_index :categories, :title
  end
end
