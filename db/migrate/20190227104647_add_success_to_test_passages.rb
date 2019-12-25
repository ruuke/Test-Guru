class AddSuccessToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :success, :boolean, default: false
  end
end
