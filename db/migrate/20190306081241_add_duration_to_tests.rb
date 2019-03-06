class AddDurationToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :duration, :integer, default: 60
  end
end
