class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :right_answer
      t.integer :question_id

      t.timestamps
    end
  end
end
