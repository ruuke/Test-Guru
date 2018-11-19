class ChangeColumnNameInUser < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :nickname, :email
  	add_column :users, :password, :string
  end
end
