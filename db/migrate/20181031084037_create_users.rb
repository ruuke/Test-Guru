class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :done_tests
      t.integer :right_answers

      t.timestamps
    end
  end
end
