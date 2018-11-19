class AddPointsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :points, :integer
  end
end
