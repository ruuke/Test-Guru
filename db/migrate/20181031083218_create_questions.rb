class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body
      
      t.timestamps
    end

    add_reference :questions, :tests, foreign_key: true
  end
end
