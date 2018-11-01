class RemoveRightAnswerFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :right_answer, :integer
  end
end
