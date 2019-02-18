class AddReferenceCategoryToTests < ActiveRecord::Migration[5.2]
  def change
  	t.references :category, foreign_key: true
  end
end
