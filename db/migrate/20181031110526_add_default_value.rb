class AddDefaultValue < ActiveRecord::Migration[5.2]
  def up
  	change_column_default(:tests, :level, 0)
  	change_column_default(:answers, :correct, nil)
  end

  def down
  	change_column_default(:tests, :level, nil)
  	change_column_default(:answers, :correct, nil)
  end
end
