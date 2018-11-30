class ChangeColumnNameInAnswers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :answers, :answer, :body
  end
end
