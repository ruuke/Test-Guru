class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :tests, :category, foreign_key: true
      
      t.timestamps
    end
  end
end
