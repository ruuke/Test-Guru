class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.text :answer
      t.references :answers, :question, foreign_key: true

      t.timestamps
    end
  end
end  
