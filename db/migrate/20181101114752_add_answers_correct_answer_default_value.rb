class AddAnswersCorrectAnswerDefaultValue < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:answers, :correct_answer, 0)
  end
end
