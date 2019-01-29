class EditTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_reference :test_passages, :current_question, foreign_key: true
    rename_column :test_passages, :points, :correct_questions
  end
end
