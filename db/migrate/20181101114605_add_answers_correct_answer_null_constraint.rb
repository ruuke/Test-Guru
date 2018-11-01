class AddAnswersCorrectAnswerNullConstraint < ActiveRecord::Migration[5.2]
  def change
  	change_column_null(:answers, :correct_answer, false)
  end
end
