class RemoveTestIdFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :test_id, :integer
  end
end
