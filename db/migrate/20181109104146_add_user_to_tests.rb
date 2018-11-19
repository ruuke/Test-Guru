class AddUserToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :user, foreign_key: true
  end
end
