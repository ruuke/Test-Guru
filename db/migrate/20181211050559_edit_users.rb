class EditUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :password, :password_digest
  	change_column_null :users, :email, false
  end
end
