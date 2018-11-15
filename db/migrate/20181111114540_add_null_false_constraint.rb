class AddNullFalseConstraint < ActiveRecord::Migration[5.2]
  def change
  	change_column_null(:answers, :question_id, false)
  	change_column_null(:questions, :test_id, false)
  	change_column_null(:test_passages, :user_id, false)
  	change_column_null(:test_passages, :test_id, false)
  	change_column_null(:tests, :user_id, false)
  	change_column_null(:tests, :category_id, false)
  end
end
