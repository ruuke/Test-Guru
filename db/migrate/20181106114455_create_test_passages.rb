class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end
  end
end
