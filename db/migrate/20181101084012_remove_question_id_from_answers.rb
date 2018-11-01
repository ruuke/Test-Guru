class RemoveQuestionIdFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :question_id, :integer
  end
end
